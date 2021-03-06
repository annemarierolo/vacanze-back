using System.Collections.Generic;
using System;
using vacanze_back.VacanzeApi.Common.Entities;
using vacanze_back.VacanzeApi.Common.Entities.Grupo1;
using vacanze_back.VacanzeApi.Common.Entities.Grupo2;
using vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo1;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo2;

namespace vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo1
{
    public class LoginMapper : Mapper<LoginDTO, Login>
    {
        /// Variable global de la clase LoginMapper para 
        /// poder acceder al Mapper de roles y transformar
        RoleMapper roleObject = new RoleMapper();


        /// <summary>
        ///     Metodo para crear un DTO a partir de un entity
        /// </summary>
        /// <param name="login">Entity de tipo LOGIN a ser convertida</param>
        /// <returns>Login de tipo DTO</returns>
        public LoginDTO CreateDTO(Login login)
        {            
            if (login.roles == null){
                return new LoginDTO{
                    id = login.Id,
                    email = login.email,
                    password = login.password
                    
                };  
            }
            else{
                return new LoginDTO{
                    id = login.Id,
                    roles = roleObject.CreateDTOList(login.roles),
                    email = login.email,
                    password = login.password
                    
                };  
            }
        }

        /// <summary>
        ///     Metodo para crear una lista de DTO a partir de una lista de login Entity
        /// </summary>
        /// <param name="logins">Lista Entities de tipo login a ser convertida</param>
        /// <returns>Lista de login de tipo DTO</returns>
        public List<LoginDTO> CreateDTOList(List<Login> logins)
        {
            List<LoginDTO> dtoList = new List<LoginDTO>();
            foreach(Login login in logins){
                dtoList.Add(new LoginDTO{
                    id = login.Id,
                    roles = roleObject.CreateDTOList(login.roles),
                    email = login.email,
                    password = login.password
                });
            }
            return dtoList;
        }

        /// <summary>
        ///     Metodo para crear un Entity a partir de una DTO
        /// </summary>
        /// <param name="loginDTO">DTO de tipo LOGIN a ser convertida</param>
        /// <returns>Login de tipo Entity</returns>
        public Login CreateEntity(LoginDTO loginDTO)
        {
            if (loginDTO.roles == null){
                return EntityFactory.createLogin(loginDTO.id, loginDTO.email, loginDTO.password);
            }
            else{
                List<Role> roles = roleObject.CreateEntityList(loginDTO.roles);
                return EntityFactory.createLogin(loginDTO.id, roles, loginDTO.email, loginDTO.password);
            }
        }

        /// <summary>
        ///     Metodo para crear una lista Entity  a partir de una lista DTO
        /// </summary>
        /// <param name="dtoList">lista DTOs de tipo login a ser convertida</param>
        /// <returns>Lista de login de tipo Entity</returns>
        public List<Login> CreateEntityList(List<LoginDTO> dtoList)
        {
            List<Login> loginEntity = new List<Login>();
            foreach(LoginDTO dtoLogin in dtoList){
                var roles = roleObject.CreateEntityList(dtoLogin.roles);
                loginEntity.Add( EntityFactory.createLogin(dtoLogin.id,
                    roles, dtoLogin.email, dtoLogin.password));
            }

            return loginEntity;
        }
    }
}