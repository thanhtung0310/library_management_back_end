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
    public async Task<ActionResult<IEnumerable<LoanOrder>>> GetLoan()
    {
      if (_context.LoanOrders == null)
      {
        return NotFound();
      }
      return await _context.LoanOrders.ToListAsync();
    }

    // GET: api/Loans/5
    [HttpGet("{id}")]
    public async Task<ActionResult<LoanOrder>> GetLoans(int id)
    {
      if (_context.LoanOrders == null)
      {
        return NotFound();
      }
      var LoanOrder = await _context.LoanOrders.FindAsync(id);

      if (LoanOrder == null)
      {
        return NotFound();
      }

      return LoanOrder;
    }

    // PUT: api/Loans/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateLoan(int id, LoanOrder loan)
    {
      if (id != loan.loanID)
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
    public async Task<ActionResult<LoanOrder>> CreateLoan(LoanOrder loan)
    {
      if (_context.LoanOrders == null)
      {
        return Problem("Entity set 'DatabaseContext.LoanOrder'  is null.");
      }
      _context.LoanOrders.Add(loan);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetLoan", new { id = loan.loanID }, loan);
    }

    // DELETE: api/Loans/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteLoan(int id)
    {
      if (_context.LoanOrders == null)
      {
        return NotFound();
      }
      var LoanOrder = await _context.LoanOrders.FindAsync(id);
      if (LoanOrder == null)
      {
        return NotFound();
      }

      _context.LoanOrders.Remove(LoanOrder);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool loanExists(int id)
    {
      return (_context.LoanOrders?.Any(e => e.loanID == id)).GetValueOrDefault();
    }
  }
}
