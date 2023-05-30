using Microsoft.AspNetCore.Mvc;
using library_management_ba.Repository;
using library_management_ba.Models;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class SearchController : BaseController
  {
    private readonly IGetService _service;
    public SearchController(IGetService service)
    {
      _service = service;
    }

    // PROCEDURE: Search for book by name
    // GET: search/book/harry potter
    [HttpGet("book/{search_string}")]
    public async Task<Response<List<BookModel>>> SearchBook(string search_string)
    {
      return await _service.SearchBook(search_string);
    }

    // PROCEDURE: Search for publisher by name
    // GET: search/publisher/abc
    [HttpGet("publisher/{search_string}")]
    public async Task<Response<List<PublisherModel>>> SearchPublisher(string search_string)
    {
      return await _service.SearchPublisher(search_string);
    }

    // PROCEDURE: Search for author by name
    // GET: search/author/J. K. Rowling
    [HttpGet("author/{search_string}")]
    public async Task<Response<List<AuthorModel>>> SearchAuthor(string search_string)
    {
      return await _service.SearchAuthor(search_string);
    }
  }
}