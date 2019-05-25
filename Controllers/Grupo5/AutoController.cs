using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using vacanze_back.Entities.Grupo5;
using vacanze_back.Connection.Grupo5;
using Newtonsoft.Json;
namespace vacanze_back.Controllers.Grupo5
{
    [Route("api/Grupo5")]
    [ApiController]
    public class AutoController:ControllerBase
    {
        
        // GET api/grupo5
        [HttpGet]
        public ActionResult<IEnumerable<String>> Get()
        {
            ConnectAuto conec= new ConnectAuto();
            Auto auto = new Auto("hola","model",123,true,"licence",543);
            conec.Agregar(auto);
            return new string[] { "success"  }; 
        }

        // GET api/grupo5/5
        [HttpDelete]
                public void  DeleteAuto(int id)
        {
            ConnectAuto conec= new ConnectAuto();
            conec.DeleteAuto(id);
           
        }

    }
}