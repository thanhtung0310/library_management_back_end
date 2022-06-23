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
    public async Task<ActionResult<IEnumerable<tbl_publisher>>> GetPublishers()
    {
      if (_context.tbl_publisher == null)
      {
        return NotFound();
      }
      return await _context.tbl_publisher.ToListAsync();
    }

    // GET: api/Publishers/5
    [HttpGet("{id}")]
    public async Task<ActionResult<tbl_publisher>> GetPublisher(int id)
    {
      if (_context.tbl_publisher == null)
      {
        return NotFound();
      }
      var tbl_publisher = await _context.tbl_publisher.FindAsync(id);

      if (tbl_publisher == null)
      {
        return NotFound();
      }

      return tbl_publisher;
    }

    // PUT: api/Publishers/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> UpdatePublisher(int id, tbl_publisher publisher)
    {
      if (id != publisher.publisher_PublisherID)
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
    public async Task<ActionResult<tbl_publisher>> CreatePublisher(tbl_publisher publisher)
    {
      if (_context.tbl_publisher == null)
      {
        return Problem("Entity set 'DatabaseContext.tbl_publisher' is null.");
      }
      _context.tbl_publisher.Add(publisher);
      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateException)
      {
        if (publisherExists(publisher.publisher_PublisherID))
        {
          return Conflict();
        }
        else
        {
          throw;
        }
      }

      return CreatedAtAction("GetPublisher", new { id = publisher.publisher_PublisherID }, publisher);
    }

    // DELETE: api/Publishers/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeletePublisher(int id)
    {
      if (_context.tbl_publisher == null)
      {
        return NotFound();
      }
      var tbl_publisher = await _context.tbl_publisher.FindAsync(id);
      if (tbl_publisher == null)
      {
        return NotFound();
      }

      _context.tbl_publisher.Remove(tbl_publisher);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool publisherExists(int id)
    {
      return (_context.tbl_publisher?.Any(e => e.publisher_PublisherID == id)).GetValueOrDefault();
    }
  }
}
