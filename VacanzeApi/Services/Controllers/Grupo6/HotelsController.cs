﻿using System.Collections.Generic;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using vacanze_back.VacanzeApi.Common.Entities;
using vacanze_back.VacanzeApi.Common.Entities.Grupo6;
using vacanze_back.VacanzeApi.Common.Entities.Grupo8;
using vacanze_back.VacanzeApi.Common.Exceptions;
using vacanze_back.VacanzeApi.Common.Exceptions.Grupo8;
using vacanze_back.VacanzeApi.LogicLayer.Command;
using vacanze_back.VacanzeApi.LogicLayer.Command.Grupo6;
using vacanze_back.VacanzeApi.LogicLayer.DTO;
using vacanze_back.VacanzeApi.LogicLayer.DTO.Grupo6;
using vacanze_back.VacanzeApi.LogicLayer.Mapper;
using vacanze_back.VacanzeApi.LogicLayer.Mapper.Grupo6;

namespace vacanze_back.VacanzeApi.Services.Controllers.Grupo6
{
    [Produces("application/json")]
    [Route("api/[controller]")]
    [EnableCors("MyPolicy")]
    [ApiController]
    public class HotelsController : ControllerBase
    {
		 private readonly ILogger<HotelsController> _logger;

        public HotelsController (ILogger<HotelsController> logger)
        {
            _logger = logger;
        }
        /// <summary>
        ///     Metodo para obtener los hoteles por ubicacion o sin ella
        /// </summary>
        /// <param name="location">id de la ubicacion donde se encuentran los hoteles</param>
        /// <returns>Objeto tipo json de los hoteles</returns>
        [HttpGet]
        public ActionResult<IEnumerable<HotelDTO>> Get([FromQuery] int location = -1)
        {
			GetHotelsCommand commandHotels = CommandFactory.GetHotelsCommand();
			GetHotelsByCityCommand commandByCity = CommandFactory.GetHotelsByCityCommand(location);
            commandHotels.Execute();
            commandByCity.Execute();

            HotelMapper hotelMapper = MapperFactory.createHotelMapper(); 
            return location == -1
                ?  hotelMapper.CreateDTOList(commandHotels.GetResult())
                :  hotelMapper.CreateDTOList(commandByCity.GetResult());
        }
        /// <summary>
        ///     Metodo para buscar los hoteles por id
        /// </summary>
        /// <param name="hotelId">ID del hotel a buscar</param>
        /// <returns>Objeto tipo json del hotel encontrado</returns>
        /// <exception cref="HotelNotFoundException">Lanzada si no existe el hotel</exception>
        [HttpGet("{hotelId}", Name = "GetHotelById")]
        public ActionResult<HotelDTO> GetById([FromRoute] int hotelId)
        {
            try
            {
                HotelMapper HotelMapper = MapperFactory.createHotelMapper();
                GetHotelByIdCommand commandId =  CommandFactory.GetHotelByIdCommand(hotelId);
                commandId.Execute ();
                DTO lDTO  = HotelMapper.CreateDTO(commandId.GetResult());               
                return Ok(lDTO);
            }
            catch (HotelNotFoundException ex)
            {
				_logger?.LogError(ex, "HotelNotFoundException when trying to get a hotel by id");
                return NotFound();
            }
        }
        /// <summary>
        ///     Metodo para crear un hotel
        /// </summary>
        /// <param name="hotelDTo">Objeto Hotel a crear</param>
        /// <returns>Objeto tipo json del hotel creado</returns>
        /// <exception cref="RequiredAttributeException">Algun atributo requerido estaba como null</exception>
        /// <exception cref="InvalidAttributeException">Algun atributo tenia un valor invalido</exception>
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public ActionResult<HotelDTO> Create([FromBody] HotelDTO hotelDTO)
        {
            try
            {     
                HotelMapper HotelMapper = MapperFactory.createHotelMapper();
                Entity entity = HotelMapper.CreateEntity(hotelDTO);
                AddHotelCommand command = CommandFactory.createAddHotelCommand ((Hotel)entity);
                command.Execute ();
                int idFromData = command.GetResult(); 
 
                GetHotelByIdCommand commandId =  CommandFactory.GetHotelByIdCommand(idFromData);
                commandId.Execute ();
                DTO lDTO  = HotelMapper.CreateDTO( commandId.GetResult());               
                    return CreatedAtAction ("Get", "hotels", lDTO);
            }
            catch (RequiredAttributeException e)
            {
				_logger?.LogError(e, "RequiredAttributeException when trying to add a hotel because some required attribute was as null");
                return new BadRequestObjectResult(new ErrorMessage(e.Message));
            }
            catch (InvalidAttributeException e)
            {
				_logger?.LogError(e, "InvalidAttributeException when trying to add Hotel because some attribute had an invalid value ");
                return new BadRequestObjectResult(new ErrorMessage(e.Message));
            }
        }
        /// <summary>
        ///     Metodo para eliminar un hotel
        /// </summary>
        /// <param name="id">ID del hotel a eliminar</param>
        /// <returns>una respuesta 200 vacia</returns>
        [HttpDelete("{id}", Name = "DeleteHotel")]
        public ActionResult Delete([FromRoute] int id)
        {
            DeleteHotelCommand command = CommandFactory.DeleteHotelCommand (id);
            command.Execute ();
            return Ok();
        }
        /// <summary>
        ///     Metodo para modifcar un hotel
        /// </summary>
        /// <param name="hotelId">ID del hotel a modificar</param>
        /// <param name="HotelDTo">Objeto hotel con la data para el hotel a modificar</param>
        /// <returns>Objeto tipo json del hotel modificado</returns>
        /// <exception cref="HotelNotFoundException">El hotel a modifcar no existe</exception>
        /// <exception cref="RequiredAttributeException">Algun atributo requerido estaba como null</exception>
        /// <exception cref="InvalidAttributeException">Algun atributo tenia un valor invalido</exception>
        [HttpPut("{hotelId}", Name = "UpdateHotel")]
        public ActionResult<HotelDTO> Update([FromRoute] int hotelId, [FromBody] HotelDTO hotelDTO)
        {
            try
            {
				GetHotelByIdCommand commandId =  CommandFactory.GetHotelByIdCommand(hotelId);
                commandId.Execute ();
				HotelMapper HotelMapper = MapperFactory.createHotelMapper();

                Entity entity = HotelMapper.CreateEntity(hotelDTO);
                UpdateHotelCommand command = CommandFactory.UpdateHotelCommand(hotelId, (Hotel) entity);
                command.Execute ();
                DTO lDTO  = HotelMapper.CreateDTO( command.GetResult());               
                return Ok(lDTO);
            }
            catch (HotelNotFoundException ex)
            {
					_logger?.LogError(ex, "HotelNotFoundException when trying to update a hotel by id");
                return new NotFoundObjectResult(
                    new ErrorMessage($"Hotel con id {hotelId} no conseguido"));
            }
            catch (RequiredAttributeException e)
            {
				_logger?.LogError(e, "Required Attribute Exception when trying to update a hotel because some required attribute was as null");
                return new BadRequestObjectResult(new ErrorMessage(e.Message));
            }
            catch (InvalidAttributeException e)
            {
				_logger?.LogError(e, "InvalidAttributeException when trying to update Hotel because some attribute had an invalid value ");
                return new BadRequestObjectResult(new ErrorMessage(e.Message));
            }
        }
        /// <summary>
        ///     Metodo para obtener la imagen de un hotel
        /// </summary>
        /// <param name="hotelId">ID del hotel que posee la imagen</param>
        /// <returns>Un string base64 de la imagen del hotel</returns>
        [HttpGet("{hotelId}/image")]
        public string GetHotelImage([FromRoute] int hotelId)
        {
			GetHotelImageCommand commandImage =  CommandFactory.GetHotelImageCommand(hotelId);
            commandImage.Execute();
            return commandImage.GetResult();
        }
    }
}