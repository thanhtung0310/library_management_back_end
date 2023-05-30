using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using library_management_ba.Entities;
using library_management_ba.Data;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class BranchesController : BaseController
  {
    private readonly DatabaseContext _context;

    public BranchesController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Branches
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Branche>>> GetBranches()
    {
      if (_context.Branches == null)
      {
        return NotFound();
      }
      return await _context.Branches.ToListAsync();
    }

    // GET: api/Branches/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Branche>> GetBranch(int id)
    {
      if (_context.Branches == null)
      {
        return NotFound();
      }
      var Branche = await _context.Branches.FindAsync(id);

      if (Branche == null)
      {
        return NotFound();
      }

      return Branche;
    }

    // PUT: api/Branches/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBranch(int id, Branche branch)
    {
      if (id != branch.branchID)
      {
        return BadRequest();
      }

      _context.Entry(branch).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!branchExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetBranch", new { id = id }, branch);
    }

    // POST: api/Branches
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Branche>> CreateBranch(Branche branch)
    {
      if (_context.Branches == null)
      {
        return Problem("Entity set 'DatabaseContext.Branche' is null.");
      }
      _context.Branches.Add(branch);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBranch", new { id = branch.branchID }, branch);
    }

    // DELETE: api/Branches/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBranch(int id)
    {
      if (_context.Branches == null)
      {
        return NotFound();
      }
      var Branche = await _context.Branches.FindAsync(id);
      if (Branche == null)
      {
        return NotFound();
      }

      _context.Branches.Remove(Branche);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool branchExists(int id)
    {
      return (_context.Branches?.Any(e => e.branchID == id)).GetValueOrDefault();
    }
  }
}