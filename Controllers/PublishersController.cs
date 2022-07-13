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
  public class PublishersController : ControllerBase
  {
    private readonly DatabaseContext _context;

    public PublishersController(DatabaseContext context)
    {
      _context = context;
    }

    // GET: api/Publishers
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Publisher>>> GetPublishers()
    {
      if (_context.Publishers == null)
      {
        return NotFound();
      }
      return await _context.Publishers.ToListAsync();
    }

    // GET: api/Publishers/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Publisher>> GetPublisher(int id)
    {
      if (_context.Publishers == null)
      {
        return NotFound();
      }
      var Publisher = await _context.Publishers.FindAsync(id);

      if (Publisher == null)
      {
        return NotFound();
      }

      return Publisher;
    }

    // PUT: api/Publishers/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdatePublisher(int id, Publisher publisher)
    {
      if (id != publisher.publisherID)
      {
        return BadRequest();
      }

      _context.Entry(publisher).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!publisherExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetPublisher", new { id = id }, publisher);
    }

    // POST: api/Publishers
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Publisher>> CreatePublisher(Publisher publisher)
    {
      if (_context.Publishers == null)
      {
        return Problem("Entity set 'DatabaseContext.Publisher' is null.");
      }
      _context.Publishers.Add(publisher);
      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateException)
      {
        if (publisherExists(publisher.publisherID))
        {
          return Conflict();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetPublisher", new { id = publisher.publisherID }, publisher);
    }

    // DELETE: api/Publishers/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeletePublisher(int id)
    {
      if (_context.Publishers == null)
      {
        return NotFound();
      }
      var Publisher = await _context.Publishers.FindAsync(id);
      if (Publisher == null)
      {
        return NotFound();
      }

      _context.Publishers.Remove(Publisher);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool publisherExists(int id)
    {
      return (_context.Publishers?.Any(e => e.publisherID == id)).GetValueOrDefault();
    }
  }
}
