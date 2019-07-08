using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Localization;
using vacanze_back.VacanzeApi.Common.Entities.Grupo14;
using vacanze_back.VacanzeApi.Common.Entities.Grupo8;
using vacanze_back.VacanzeApi.Common.Exceptions;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo14;
using vacanze_back.VacanzeApi.Persistence.Repository.Grupo14;
using vacanze_back.VacanzeApi.LogicLayer.Command;
using vacanze_back.VacanzeApi.LogicLayer.Command.Grupo14;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo14;
using vacanze_back.VacanzeApi.LogicLayer.Mapper;
using vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo14;

namespace vacanze_back.VacanzeApi.Services.Controllers.Grupo14
{
	[Produces("application/json")] 
	[Route("api/[controller]")]
	[EnableCors("MyPolicy")]
	[ApiController]
	public class ResRestaurantController : ControllerBase
	{
		//POST api/ResRestaurant
		[HttpPost]
		public ActionResult<int> Post([FromBody] reservationRestaurant resAux)
		{            
			try{
                Restaurant_res reserva = new Restaurant_res(resAux.fecha_res, resAux.cant_people, resAux.date, resAux.user_id, resAux.rest_id);
                AddResRestaurantCommand command = CommandFactory.AddResRestaurantCommand(reserva);
                command.Execute();
                
                //            var id = ResRestaurantRepository.addReservation(reserva);
                //Console.WriteLine(id);
                return Ok();
            }
            catch (DatabaseException)
			{            
                Console.WriteLine("Estoy en el databaseException");
				return StatusCode(500);
			}
			catch (InvalidStoredProcedureSignatureException )
			{
                Console.WriteLine("Estoy en el InvalidStoredProcedureSignatureException");
				return StatusCode(500);
			}
			catch(AvailabilityException e){
				ErrorMessage errorMessage = new ErrorMessage(e.Message);
                return BadRequest(errorMessage);
			}

		}

		//GET /ResRestaurant/{id}
		[HttpGet("{id}")]
		public ActionResult<IEnumerable<ResRestaurantDTO>> Get(int id){ //PATRONES LISTO
            var getByIdCommand = CommandFactory.GetResRestaurantByIdCommand(id);
            try {
				Console.WriteLine(id);
                //return ResRestaurantRepository.getResRestaurant(id);
                getByIdCommand.Execute();
                //return getByIdCommand.GetResult();
                ResRestaurantMapper resRestMapper = MapperFactory.createResRestaurantMapper();
                return resRestMapper.CreateDTOList(getByIdCommand.GetResult());
            }
            catch (DatabaseException ){            
				return StatusCode(500);
			}
			catch (InvalidStoredProcedureSignatureException ){
				return StatusCode(500);
			}
		}

		//GET /ResRestaurant/Payment/{id} el ID es el del usuario
		[HttpGet("Payment/{userId}")]
		public ActionResult<IEnumerable<ResRestaurantDTO>> GetReservationNotPay(int userId){ //this method is not used to this preview

            var getResNotPayByIdCommand = CommandFactory.GetResRestaurantNotPayByIdCommand(userId);
            try {
                Console.WriteLine(userId);
                //return ResRestaurantRepository.getReservationNotPay(userId);
                getResNotPayByIdCommand.Execute();

                ResRestaurantMapper resRestMapper = MapperFactory.createResRestaurantMapper();
                return resRestMapper.CreateDTOList(getResNotPayByIdCommand.GetResult());
            }
            catch (DatabaseException ){            
				return StatusCode(500);
			}
			catch (InvalidStoredProcedureSignatureException ){
				return StatusCode(500);
			}
		}

		//DELETE api/ResRestaurant/id el ID es el de la reserva
		[HttpDelete("{id}")]
		public ActionResult<string> Delete(int id){ //PATRONES LISTO

			
            DeleteResRestaurantCommand command = CommandFactory.DeleteResRestaurantCommand(id);
            command.Execute();
            return Ok();

        }

		//PUT api/ResRestaurant/id es el id de la reserva
		[HttpPut("{id}")]
		public ActionResult<string> Put(int id, reservationRestaurant resAux)
		{
			try{
				Console.WriteLine(id);
				ResRestaurantRepository conec = new ResRestaurantRepository();
				Restaurant_res reserva = new Restaurant_res(resAux.pay_id);

				Console.WriteLine(resAux.pay_id);

				if (resAux.pay_id == 0){
					ResponseError mensaje= new ResponseError();
					mensaje.error="No se puede nodificar un valor nulo";
					return StatusCode(500,mensaje);
				}						
				else{
					int modifyId = conec.updateResRestaurant(resAux.pay_id, id);
					if (modifyId == -1){
						ResponseError mensaje= new ResponseError();
						mensaje.error="No se puede modificar su reservacion.";
						return StatusCode(500,mensaje);
					}
					//Me regresa el ID de la reserva modificada
					return Ok(modifyId);
				}
				
			}catch (DatabaseException )
			{            
				ResponseError mensaje= new ResponseError();
				mensaje.error="DataBase error.";
				return StatusCode(500, mensaje);
			}
			catch (InvalidStoredProcedureSignatureException e)
			{
				ResponseError mensaje= new ResponseError();
				mensaje.error="Error interno.";
				return StatusCode(500);
			}
		}


	}

    public class ResponseError {
	    public string error{get; set;}
	
	}
	public class reservationRestaurant {
		public string fecha_res { get; set; }
       
        public int cant_people{get; set;}

        public string date { get; set;}

        public int user_id { get; set;}

        public int rest_id { get; set;}

		public int pay_id {get; set;}
	}
}