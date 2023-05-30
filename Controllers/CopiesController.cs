using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using library_management_ba.Entities;
using library_management_ba.Data;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class CopiesController : BaseController
  {
    private readonly DatabaseContext _context;

    public CopiesController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Copies
    [HttpGet]
    public async Task<ActionResult<IEnumerable<CopiesNumber>>> GetCopies()
    {
      if (_context.CopiesNumbers == null)
      {
        return NotFound();
      }
      return await _context.CopiesNumbers.ToListAsync();
    }

    // GET: api/Copies/5
    [HttpGet("{id}")]
    public async Task<ActionResult<CopiesNumber>> GetCopy(int id)
    {
      if (_context.CopiesNumbers == null)
      {
        return NotFound();
      }
      var CopiesNumber = await _context.CopiesNumbers.FindAsync(id);

      if (CopiesNumber == null)
      {
        return NotFound();
      }

      return CopiesNumber;
    }

    // PUT: api/Copies/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateCopy(int id, CopiesNumber copy)
    {
      if (id != copy.copiesID)
      {
        return BadRequest();
      }

      _context.Entry(copy).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!copyExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetCopy", new { id = id }, copy);
    }

    // POST: api/Copies
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<CopiesNumber>> CreateCopy(CopiesNumber copy)
    {
      if (_context.CopiesNumbers == null)
      {
        return Problem("Entity set 'DatabaseContext.CopiesNumber' is null.");
      }
      _context.CopiesNumbers.Add(copy);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetCopy", new { id = copy.copiesID }, copy);
    }

    // DELETE: api/Copies/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteCopy(int id)
    {
      if (_context.CopiesNumbers == null)
      {
        return NotFound();
      }
      var CopiesNumber = await _context.CopiesNumbers.FindAsync(id);
      if (CopiesNumber == null)
      {
        return NotFound();
      }

      _context.CopiesNumbers.Remove(CopiesNumber);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool copyExists(int id)
    {
      return (_context.CopiesNumbers?.Any(e => e.copiesID == id)).GetValueOrDefault();
    }
  }
}
