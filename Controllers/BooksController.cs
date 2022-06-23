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
  public class BooksController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public BooksController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/books
    [HttpGet]
    public async Task<ActionResult<IEnumerable<tbl_book>>> GetBooks()
    {
      if (_context.tbl_book == null)
      {
        return NotFound();
      }
      return await _context.tbl_book.ToListAsync();
    }

    // GET: api/books/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_book>> GetBook(int id)
    {
      if (_context.tbl_book == null)
      {
        return NotFound();
      }
      var tbl_book = await _context.tbl_book.FindAsync(id);

      if (tbl_book == null)
      {
        return NotFound();
      }

      return tbl_book;
    }

    // PUT: api/books/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBook(int id, tbl_book book)
    {
      if (id != book.book_BookID)
      {
        return BadRequest();
      }

      _context.Entry(book).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!bookExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetBook", new { id = id }, book);
    }

    // POST: api/books
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<tbl_book>> CreateBook(tbl_book book)
    {
      if (_context.tbl_book == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_book' is null.");
      }
      _context.tbl_book.Add(book);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBook", new { id = book.book_BookID }, book);
    }

    // DELETE: api/books/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBook(int id)
    {
      if (_context.tbl_book == null)
      {
        return NotFound();
      }
      var tbl_book = await _context.tbl_book.FindAsync(id);
      if (tbl_book == null)
      {
        return NotFound();
      }

      _context.tbl_book.Remove(tbl_book);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool bookExists(int id)
    {
      return (_context.tbl_book?.Any(e => e.book_BookID == id)).GetValueOrDefault();
    }
  }
}
