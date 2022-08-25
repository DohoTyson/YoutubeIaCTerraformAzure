using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace SampleApi.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PersonsController : Controller
    {
        private readonly ILogger<PersonsController> _logger;

        public PersonsController(ILogger<PersonsController> logger)
        {
            _logger = logger;
        }

        [HttpGet]
        public IActionResult GetPersons()
        {
            var persons = new string [] 
            {
                "David",
                "Donald Duck",
                "Mickey",
                "Batman",
                "Thor",
                "Tony Stark"
            };
            return Ok(persons);
        }
    }
}