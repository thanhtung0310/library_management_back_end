using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using library_management_ba.Entities;
using library_management_ba.Data;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class AuthorsController : BaseController
  {
    private readonly DatabaseContext _context;

    public AuthorsController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/authors
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Author>>> GetAuthors()
    {
      if (_context.Authors == null)
      {
        return NotFound();
      }
      return await _context.Authors.ToListAsync();
    }

    // GET: api/authors/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Author>> GetAuthor(int id)
    {
      if (_context.Authors == null)
      {
        return NotFound();
      }
      var Author = await _context.Authors.FindAsync(id);

      if (Author == null)
      {
        return NotFound();
      }

      return Author;
    }

    // PUT: api/authors/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<ActionResult<Author>> UpdateAuthor(int id, Author author)
    {
      if (id != author.authorID)
      {
        return BadRequest();
      }

      _context.Entry(author).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!authorExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetAuthor", new { id = id }, author); ;
    }

    // POST: api/authors
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Author>> CreateAuthor(Author author)
    {
      if (_context.Authors == null)
      {
        return Problem("Entity set 'DatabaseContext.Author' is null.");
      }
      _context.Authors.Add(author);
      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateException)
      {
        if (!authorExists(author.authorID))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetAuthor", new { id = author.authorID }, author);
    }

    // DELETE: api/authors/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteAuthor(int id)
    {
      if (_context.Authors == null)
      {
        return NotFound();
      }

      var Author = await _context.Authors.FindAsync(id);
      if (Author == null)
      {
        return NotFound();
      }

      _context.Authors.Remove(Author);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool authorExists(int id)
    {
      return (_context.Authors?.Any(e => e.authorID == id)).GetValueOrDefault();
    }
  }
}