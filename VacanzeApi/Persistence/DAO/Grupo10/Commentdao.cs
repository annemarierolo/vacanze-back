using vacanze_back.VacanzeApi.Common.Entities.Grupo10;
using vacanze_back.VacanzeApi.Common.Entities.Grupo2;
using System;
using vacanze_back.VacanzeApi.Common.Exceptions;
using System.Data;
using System.Collections.Generic;
using vacanze_back.VacanzeApi.Common.Entities;
using vacanze_back.VacanzeApi.Persistence.Repository.Grupo2;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo10;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo14;

namespace vacanze_back.VacanzeApi.Persistence.DAO.Grupo10
{
    public class Commentdao : Icomment
    {
       
        public int addcomment(Comment comment)
        {int id = 0;
            try{
                 if( string.IsNullOrEmpty(comment.description) ||
                    comment.datetime == DateTime.MinValue ||
                     
                    string.IsNullOrEmpty(comment.idforanea.ToString())  ) 
                {
                    throw new RequiredAttributeException("Falta información importante para poder crear el viaje");
                }

                PgConnection pgConnection = PgConnection.Instance;
                DataTable dataTable = pgConnection.ExecuteFunction(
                    "addcomment( @commentdescription, @tcommentdatetime, @commentidforanea)",comment.description,comment.datetime.ToString("yyyy-MM-dd"),comment.idforanea);
                id = Convert.ToInt32(dataTable.Rows[0][0]);
                
               }
               catch(DatabaseException ex){
                throw new InternalServerErrorException("Error en el servidor : Conexion a base de datos", ex);
            }catch(InvalidStoredProcedureSignatureException ex){
                throw new InternalServerErrorException("Error en el servidor", ex);
            }
            return id;
            
        }

        public int Deletecomment(int id)
        {/*Esta funcion es la que se conecta directamente a la BD para borrar un comentario
        mediante su atributo identificador */
            try 
            {
                int i=0;

             PgConnection pgConnection = PgConnection.Instance;
            
             pgConnection.ExecuteFunction("DeleteComment(@com_ID)", id);
             return i ;
       
                
            }
            catch (InvalidCastException)
            {
                throw new DeleteReservationException("el comentario no existe.");
            }
            catch (DatabaseException)
            {
                throw new DeleteReservationException("Error con la base de datos.");
            }
        }

        public List<Comment> Getcomment(int id)
        {/*esta funcion se encarga de traer desde la BD toda la informacion de un comentario
        hasta el front, mediante el id especificado */
            List<Comment> Listcomment = new List<Comment>();
            try{
               
                PgConnection pgConnection = PgConnection.Instance;
                DataTable dataTable = pgConnection.ExecuteFunction("Getcommentid (@id)", id);
               
                if( dataTable.Rows.Count > 0){
                     
                     Console.WriteLine(dataTable.Rows.Count);
                    foreach (DataRow dataRow in dataTable.Rows){
                     
                        
                         Comment comments = new Comment(
                            Convert.ToInt32(dataRow[0]),
                            dataRow[1].ToString(),
                            Convert.ToDateTime(dataRow[2]),
                            Convert.ToInt32(dataRow[3])
                        );   
                       
                        Listcomment.Add(comments);  
                    }
                }else{
                    throw new WithoutExistenceOfTravelsException(id, "no se encontro ningun comentario con este id ");
                }
            }catch(DatabaseException ex){
                throw new InternalServerErrorException("Error en el servidor : Conexion a base de datos", ex);
            }catch(InvalidStoredProcedureSignatureException ex){
                throw new InternalServerErrorException("Error en el servidor", ex);
            }
            return Listcomment;
        }

        public bool Updatecomment(Comment comment)
        {/*esta funcion se encarga de sobreescribir el contenido de un comentario
          seleccionado anteriormente en el front */
             Boolean result=false;
            try{
                Console.WriteLine(comment.idcoment+comment.description+comment.datetime.ToString("yyyy-MM-dd")+comment.idforanea);
                PgConnection pgConnection = PgConnection.Instance;
                DataTable dataTable = pgConnection.ExecuteFunction(
                    "updatecomment(@commentId ,@commentdescription, @commentdatetime, @commentidforanea)",
                     comment.idcoment,comment.description,comment.datetime.ToString("yyyy-MM-dd"),comment.idforanea);
                if(Convert.ToBoolean(dataTable.Rows[0][0])){
                    result = true;
                }

            }catch(DatabaseException ex){
                throw new InternalServerErrorException("Error en el servidor : Conexion a base de datos", ex);
            }catch(InvalidStoredProcedureSignatureException ex){
                throw new InternalServerErrorException("Error en el servidor", ex);
            }

           return result;
        
        }
    }
}