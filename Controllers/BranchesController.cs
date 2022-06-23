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
  public class BranchesController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public BranchesController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Branches
    [HttpGet]
    public async Task<ActionResult<IEnumerable<tbl_library_branch>>> GetBranches()
    {
      if (_context.tbl_library_branch == null)
      {
        return NotFound();
      }
      return await _context.tbl_library_branch.ToListAsync();
    }

    // GET: api/Branches/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_library_branch>> GetBranch(int id)
    {
      if (_context.tbl_library_branch == null)
      {
        return NotFound();
      }
      var tbl_library_branch = await _context.tbl_library_branch.FindAsync(id);

      if (tbl_library_branch == null)
      {
        return NotFound();
      }

      return tbl_library_branch;
    }

    // PUT: api/Branches/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBranch(int id, tbl_library_branch branch)
    {
      if (id != branch.library_branch_BranchID)
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
    public async Task<ActionResult<tbl_library_branch>> CreateBranch(tbl_library_branch branch)
    {
      if (_context.tbl_library_branch == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_library_branch' is null.");
      }
      _context.tbl_library_branch.Add(branch);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBranch", new { id = branch.library_branch_BranchID }, branch);
    }

    // DELETE: api/Branches/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBranch(int id)
    {
      if (_context.tbl_library_branch == null)
      {
        return NotFound();
      }
      var tbl_library_branch = await _context.tbl_library_branch.FindAsync(id);
      if (tbl_library_branch == null)
      {
        return NotFound();
      }

      _context.tbl_library_branch.Remove(tbl_library_branch);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool branchExists(int id)
    {
      return (_context.tbl_library_branch?.Any(e => e.library_branch_BranchID == id)).GetValueOrDefault();
    }
  }
}
