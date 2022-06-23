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
  public class AuthorsController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public AuthorsController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/authors
    [HttpGet]
    public async Task<ActionResult<IEnumerable<tbl_book_authors>>> GetAuthors()
    {
      if (_context.tbl_book_authors == null)
      {
        return NotFound();
      }
      return await _context.tbl_book_authors.ToListAsync();
    }

    // GET: api/authors/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_book_authors>> GetAuthor(int id)
    {
      if (_context.tbl_book_authors == null)
      {
        return NotFound();
      }
      var tbl_book_authors = await _context.tbl_book_authors.FindAsync(id);

      if (tbl_book_authors == null)
      {
        return NotFound();
      }

      return tbl_book_authors;
    }

    // PUT: api/authors/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<ActionResult<tbl_book_authors>> UpdateAuthor(int id, tbl_book_authors author)
    {
      if (id != author.book_authors_AuthorID)
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
    public async Task<ActionResult<tbl_book_authors>> CreateAuthor(tbl_book_authors author)
    {
      if (_context.tbl_book_authors == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_book_authors' is null.");
      }
      _context.tbl_book_authors.Add(author);
      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateException)
      {
        if (!authorExists(author.book_authors_AuthorID))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetAuthor", new { id = author.book_authors_AuthorID }, author);
    }

    // DELETE: api/authors/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteAuthor(int id)
    {
      if (_context.tbl_book_authors == null)
      {
        return NotFound();
      }

      var tbl_book_authors = await _context.tbl_book_authors.FindAsync(id);
      if (tbl_book_authors == null)
      {
        return NotFound();
      }

      _context.tbl_book_authors.Remove(tbl_book_authors);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool authorExists(int id)
    {
      return (_context.tbl_book_authors?.Any(e => e.book_authors_AuthorID == id)).GetValueOrDefault();
    }
  }
}
