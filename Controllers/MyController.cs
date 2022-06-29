namespace library_management_ba.Controllers
{
  using Microsoft.AspNetCore.Mvc;
  using library_management_ba.Repository;
  using library_management_ba.Models;

  [Route("api/[controller]")]
  [ApiController]
  public class MyController : ControllerBase
  {
    private readonly IService _service;
    public MyController(IService service)
    {
      _service = service;
    }
    // FUNCTION: Get list of all books
    // GET: api/my/
    [HttpGet]
    public async Task<Response<List<BookModel>>> GetBookList()
    {
      return await _service.GetBookList();
    }
  }
}