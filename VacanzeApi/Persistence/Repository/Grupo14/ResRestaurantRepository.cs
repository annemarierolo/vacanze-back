using System;
using System.Data;
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using vacanze_back.VacanzeApi.Common.Entities.Grupo14;
using vacanze_back.VacanzeApi.Common.Exceptions;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo14;

namespace vacanze_back.VacanzeApi.Persistence.Repository.Grupo14{
    public class ResRestaurantRepository{

        /// <summary>
        ///     Metodo para agregar una reserva de restaurant
        /// </summary>
        /// <param name="reserva"></param>
        public static int addReservation(Restaurant_res reserva){

            var table = PgConnection.Instance.ExecuteFunction("getAvailability(@res_id, @res_date)",
            reserva.rest_id, reserva.fecha_res);
            var capacidad=Convert.ToInt32(table.Rows[0][0]);

            var tableRest = PgConnection.Instance.ExecuteFunction("getAvailabilityRest(@res_id)",
            reserva.rest_id);
            var capacidadRest = Convert.ToInt32(tableRest.Rows[0][0]);

            if(capacidad == 0 && reserva.cant_people < capacidadRest){
                //Eso indica que puede reservar porque no hay reservas para esa hora y el numero no excede de lo disponible
                var resRest = PgConnection.Instance.ExecuteFunction(
                "addreservationrestaurant(@fecha, @people, @fecha_reservacion, @userId, @restaurantId)",
                reserva.fecha_res,reserva.cant_people, reserva.date, reserva.user_id, reserva.rest_id);
                
                var idRest = Convert.ToInt32(resRest.Rows[0][0]);
                Console.WriteLine("Id: ");
                Console.WriteLine(idRest);
                return idRest;
            }
            else{
                if(capacidad < reserva.cant_people){
                    //Este if indica que se quiere reservar una cantidad mayor a la que hay disponible para ese restaurant para esa fecha
                    throw new AvailabilityException("Sorry, not availability at this hour");
                }
                else{
                    //if capacidad != 0 && capacidad >= reserva.cant_people
                    var resRest = PgConnection.Instance.ExecuteFunction(
                    "addreservationrestaurant(@fecha, @people, @fecha_reservacion, @userId, @restaurantId)",
                    reserva.fecha_res,reserva.cant_people, reserva.date, reserva.user_id, reserva.rest_id);
                    
                    var idRest = Convert.ToInt32(resRest.Rows[0][0]);
                    Console.WriteLine("Id: ");
                    Console.WriteLine(idRest);
                    return idRest;
                }
            }
        }
    
         
        public static List<Restaurant_res> getResRestaurant(int user){

            var ReservationList = new List<Restaurant_res>();
            var table = PgConnection.Instance.ExecuteFunction("getResRestaurant(@usuario)",user);
            for (var i = 0; i < table.Rows.Count; i++){
                //Orden del SP id, ciudad, pais, restaurant, direccion, fecha_res, cant_persona
                var id = Convert.ToInt32(table.Rows[i][0].ToString());
                var locationName = table.Rows[i][1].ToString();
                var pais = table.Rows[i][2].ToString();
                var restName = table.Rows[i][3].ToString();
                var address =  table.Rows[i][4].ToString();
                var fecha_reservacion =  table.Rows[i][5].ToString();
                var cant_persona = Convert.ToInt32(table.Rows[i][6].ToString());

                var Restaurant_res = new Restaurant_res(id,locationName, pais, restName, address, fecha_reservacion, cant_persona);
                ReservationList.Add(Restaurant_res);
            };
            return ReservationList;
        }

        public static List<Restaurant_res> getReservationNotPay(int user){

            var ReservationList = new List<Restaurant_res>();
            var table = PgConnection.Instance.ExecuteFunction("getReservationNotPay(@usuario)",user);
            for (var i = 0; i < table.Rows.Count; i++){
                //Orden del SP id, ciudad, pais, restaurant, direccion, fecha_res, cant_persona
                var id = Convert.ToInt32(table.Rows[i][0].ToString());
                var fecha_reservacion = table.Rows[i][1].ToString();
                var tipo = "Restaurantes";

                var Restaurant_res = new Restaurant_res(id, fecha_reservacion, tipo);
                ReservationList.Add(Restaurant_res);
            };
            return ReservationList;
        }

        public int deleteResRestaurant(int resRestId){
            try{
                var table = PgConnection.Instance.ExecuteFunction("deleteReservation(@reservationID)",resRestId);
                var deletedid = Convert.ToInt32(table.Rows[0][0]);
                Console.WriteLine(deletedid);
                return deletedid;
            }
            catch(InvalidCastException){
                throw new DeleteReservationException("La reserva no existe.");
            }
            catch(DatabaseException){
                throw new DeleteReservationException("Error con la base de datos.");
            }
        }

        public int updateResRestaurant(int payID, int resRestID){
            try{
                Console.WriteLine(payID); Console.WriteLine(resRestID);
                var table = PgConnection.Instance.ExecuteFunction("modifyReservationPayment(@pay, @reservation)", payID, resRestID);
                var modifyId = Convert.ToInt32(table.Rows[0][0]);
                Console.WriteLine(modifyId);
                return modifyId;
            }
            catch (InvalidOperationException)
            {
                throw new UpdateReservationException("Error, no se pudo actualizar el pago de reserva");
            }
            catch (InvalidCastException)
            {
                throw new UpdateReservationException("Error, no se pudo encontrar y actualizar el pago de reserva");
            }
            catch (DatabaseException)
            {
                throw new UpdateReservationException("Error, no se pudo conectar con la base de datos");
            }
        }
    }
}