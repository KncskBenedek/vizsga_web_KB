using Backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace Backend.Controllers
{
    [Route("tema")]
    [ApiController]
    public class TemaController : ControllerBase
    {

        VizsgaContext _context;
        public TemaController(VizsgaContext context)
        {
            _context = context;
        }
        [HttpGet]
        public async Task<ActionResult<List<Tema>>> Get()
        {
            var temak = await _context.Temas.ToArrayAsync();
            if (temak.IsNullOrEmpty())
            {
                return BadRequest("Nincsenek témák.");
            }
            return Ok(temak);

        }
        [HttpGet("{id}")]
        public async Task<ActionResult<List<Tema>>> GetOne(int id)
        {
            var tema = await _context.Temas.FindAsync(id);
            if (tema.Equals(null))
            {
                return BadRequest("Nincs ilyen téma.");
            }
            return Ok(tema);
        }


    }
}
