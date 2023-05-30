using library_management_ba.Data;
using library_management_ba.Entities;
using library_management_back_end.Controllers;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace library_management_ba.Controllers
{
  public class UsersController : BaseController
  {
    private readonly DatabaseContext _context;

    public UsersController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/users
    [HttpGet]
    public async Task<ActionResult<IEnumerable<User>>> GetUsers()
    {
      if (_context.Users == null)
      {
        return NotFound();
      }
      return await _context.Users.ToListAsync();
    }

    // GET: api/users/5
    [HttpGet("{id}")]
    public async Task<ActionResult<User>> GetUser(int id)
    {
      if (_context.Users == null)
      {
        return NotFound();
      }
      var User = await _context.Users.FindAsync(id);

      if (User == null)
      {
        return NotFound();
      }

      return User;
    }

    // PUT: api/users/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<ActionResult<User>> UpdateUser(int id, User User)
    {
      if (id != User.userID)
      {
        return BadRequest();
      }

      _context.Entry(User).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!userExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetUser", new { id = id }, User); ;
    }

    // POST: api/users
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<User>> CreateUser(User User)
    {
      if (_context.Users == null)
      {
        return Problem("Entity set 'DatabaseContext.User' is null.");
      }
      _context.Users.Add(User);
      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateException)
      {
        if (!userExists(User.userID))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetUser", new { id = User.userID }, User);
    }

    // DELETE: api/users/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteUser(int id)
    {
      if (_context.Users == null)
      {
        return NotFound();
      }

      var User = await _context.Users.FindAsync(id);
      if (User == null)
      {
        return NotFound();
      }

      _context.Users.Remove(User);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool userExists(int id)
    {
      return (_context.Users?.Any(e => e.userID == id)).GetValueOrDefault();
    }
  }
}