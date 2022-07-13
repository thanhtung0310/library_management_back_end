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
  public class BorrowersController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public BorrowersController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Borrowers
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Borrower>>> GetBorrowers()
    {
      if (_context.Borrowers == null)
      {
        return NotFound();
      }
      return await _context.Borrowers.ToListAsync();
    }

    // GET: api/Borrowers/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Borrower>> GetBorrower(int id)
    {
      if (_context.Borrowers == null)
      {
        return NotFound();
      }
      var Borrower = await _context.Borrowers.FindAsync(id);

      if (Borrower == null)
      {
        return NotFound();
      }

      return Borrower;
    }

    // PUT: api/Borrowers/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBorrower(int id, Borrower borrower)
    {
      if (id != borrower.borrowerID)
      {
        return BadRequest();
      }

      _context.Entry(borrower).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!borrowerExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetBorrower", new { id = id }, borrower);
    }

    // POST: api/Borrowers
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Borrower>> CreateBorrower(Borrower borrower)
    {
      if (_context.Borrowers == null)
      {
        return Problem("Entity set 'DatabaseContext.Borrower' is null.");
      }
      _context.Borrowers.Add(borrower);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBorrower", new { id = borrower.borrowerID }, borrower);
    }

    // DELETE: api/Borrowers/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBorrower(int id)
    {
      if (_context.Borrowers == null)
      {
        return NotFound();
      }
      var Borrower = await _context.Borrowers.FindAsync(id);
      if (Borrower == null)
      {
        return NotFound();
      }

      _context.Borrowers.Remove(Borrower);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool borrowerExists(int id)
    {
      return (_context.Borrowers?.Any(e => e.borrowerID == id)).GetValueOrDefault();
    }
  }
}
