using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using library_management_ba.Entities;
using library_management_ba.Data;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class BooksController : BaseController
  {
    private readonly DatabaseContext _context;

    public BooksController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/books
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Book>>> GetBooks()
    {
      if (_context.Books == null)
      {
        return NotFound();
      }
      return await _context.Books.ToListAsync();
    }

    // GET: api/books/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Book>> GetBook(int id)
    {
      if (_context.Books == null)
      {
        return NotFound();
      }
      var Book = await _context.Books.FindAsync(id);

      if (Book == null)
      {
        return NotFound();
      }

      return Book;
    }

    // PUT: api/books/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdateBook(int id, Book book)
    {
      if (id != book.bookID)
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
    public async Task<ActionResult<Book>> CreateBook(Book book)
    {
      if (_context.Books == null)
      {
        return Problem("Entity set 'DatabaseContext.Book' is null.");
      }
      _context.Books.Add(book);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetBook", new { id = book.bookID }, book);
    }

    // DELETE: api/books/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteBook(int id)
    {
      if (_context.Books == null)
      {
        return NotFound();
      }
      var Book = await _context.Books.FindAsync(id);
      if (Book == null)
      {
        return NotFound();
      }

      _context.Books.Remove(Book);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool bookExists(int id)
    {
      return (_context.Books?.Any(e => e.bookID == id)).GetValueOrDefault();
    }
  }
}