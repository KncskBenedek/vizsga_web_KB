using Backend.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;

namespace Backend.Controllers
{
    [Route("szavak")]
    [ApiController]
    public class SzavakController : ControllerBase
    {

        VizsgaContext _context;
        public SzavakController(VizsgaContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Szavak>>> Get()
        {
            var szavak = await _context.Szavaks.Include(x => x.Tema).ToArrayAsync();
            if (szavak.IsNullOrEmpty())
            {
                return BadRequest("Nincsenek szavak.");
            }
            return Ok(szavak);
        }
    }
}
