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
    public async Task<ActionResult<IEnumerable<tbl_borrower>>> GetBorrowers()
    {
      if (_context.tbl_borrower == null)
      {
        return NotFound();
      }
      return await _context.tbl_borrower.ToListAsync();
    }

    // GET: api/Borrowers/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_borrower>> GetBorrower(int id)
    {
      if (_context.tbl_borrower == null)
      {
        return NotFound();
      }
      var tbl_borrower = await _context.tbl_borrower.FindAsync(id);

      if (tbl_borrower == null)
      {
        return NotFound();
      }

      return tbl_borrower;
    }

    // PUT: api/Borrowers/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBorrower(int id, tbl_borrower borrower)
    {
      if (id != borrower.borrower_CardNo)
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
    public async Task<ActionResult<tbl_borrower>> CreateBorrower(tbl_borrower borrower)
    {
      if (_context.tbl_borrower == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_borrower' is null.");
      }
      _context.tbl_borrower.Add(borrower);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBorrower", new { id = borrower.borrower_CardNo }, borrower);
    }

    // DELETE: api/Borrowers/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBorrower(int id)
    {
      if (_context.tbl_borrower == null)
      {
        return NotFound();
      }
      var tbl_borrower = await _context.tbl_borrower.FindAsync(id);
      if (tbl_borrower == null)
      {
        return NotFound();
      }

      _context.tbl_borrower.Remove(tbl_borrower);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool borrowerExists(int id)
    {
      return (_context.tbl_borrower?.Any(e => e.borrower_CardNo == id)).GetValueOrDefault();
    }
  }
}
