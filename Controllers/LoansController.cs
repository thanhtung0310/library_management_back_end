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
  public class LoansController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public LoansController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Loans
    [HttpGet]
    public async Task<ActionResult<IEnumerable<tbl_book_loans>>> GetLoan()
    {
      if (_context.tbl_book_loans == null)
      {
        return NotFound();
      }
      return await _context.tbl_book_loans.ToListAsync();
    }

    // GET: api/Loans/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_book_loans>> GetLoans(int id)
    {
      if (_context.tbl_book_loans == null)
      {
        return NotFound();
      }
      var tbl_book_loans = await _context.tbl_book_loans.FindAsync(id);

      if (tbl_book_loans == null)
      {
        return NotFound();
      }

      return tbl_book_loans;
    }

    // PUT: api/Loans/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateLoan(int id, tbl_book_loans loan)
    {
      if (id != loan.book_loans_LoansID)
      {
        return BadRequest();
      }

      _context.Entry(loan).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!loanExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetLoan", new { id = id }, loan);
    }

    // POST: api/Loans
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<tbl_book_loans>> CreateLoan(tbl_book_loans loan)
    {
      if (_context.tbl_book_loans == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_book_loans'  is null.");
      }
      _context.tbl_book_loans.Add(loan);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetLoan", new { id = loan.book_loans_LoansID }, loan);
    }

    // DELETE: api/Loans/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteLoan(int id)
    {
      if (_context.tbl_book_loans == null)
      {
        return NotFound();
      }
      var tbl_book_loans = await _context.tbl_book_loans.FindAsync(id);
      if (tbl_book_loans == null)
      {
        return NotFound();
      }

      _context.tbl_book_loans.Remove(tbl_book_loans);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool loanExists(int id)
    {
      return (_context.tbl_book_loans?.Any(e => e.book_loans_LoansID == id)).GetValueOrDefault();
    }
  }
}
