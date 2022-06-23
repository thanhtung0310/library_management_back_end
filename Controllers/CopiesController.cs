using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using library_management_ba.Entities;
using library_management_ba.Data;

namespace library_management_ba.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class CopiesController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public CopiesController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Copies
    [HttpGet]
    public async Task<ActionResult<IEnumerable<tbl_book_copies>>> GetCopies()
    {
      if (_context.tbl_book_copies == null)
      {
        return NotFound();
      }
      return await _context.tbl_book_copies.ToListAsync();
    }

    // GET: api/Copies/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_book_copies>> GetCopy(int id)
    {
      if (_context.tbl_book_copies == null)
      {
        return NotFound();
      }
      var tbl_book_copies = await _context.tbl_book_copies.FindAsync(id);

      if (tbl_book_copies == null)
      {
        return NotFound();
      }

      return tbl_book_copies;
    }

    // PUT: api/Copies/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateCopy(int id, tbl_book_copies copy)
    {
      if (id != copy.book_copies_CopiesID)
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
    public async Task<ActionResult<tbl_book_copies>> CreateCopy(tbl_book_copies copy)
    {
      if (_context.tbl_book_copies == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_book_copies' is null.");
      }
      _context.tbl_book_copies.Add(copy);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetCopy", new { id = copy.book_copies_CopiesID }, copy);
    }

    // DELETE: api/Copies/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteCopy(int id)
    {
      if (_context.tbl_book_copies == null)
      {
        return NotFound();
      }
      var tbl_book_copies = await _context.tbl_book_copies.FindAsync(id);
      if (tbl_book_copies == null)
      {
        return NotFound();
      }

      _context.tbl_book_copies.Remove(tbl_book_copies);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool copyExists(int id)
    {
      return (_context.tbl_book_copies?.Any(e => e.book_copies_CopiesID == id)).GetValueOrDefault();
    }
  }
}
