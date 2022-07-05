namespace library_management_ba.Controllers
{
  using Microsoft.AspNetCore.Mvc;
  using library_management_ba.Repository;
  using library_management_ba.Models;
  [Route("[controller]")]
  [ApiController]
  public class PostController : ControllerBase
  {
    private readonly IPostService _service;
    public PostController(IPostService service)
    {
      _service = service;
    }

    // PROCEDURE: Create new borrower
    // POST: post/borrower
    [HttpPost("borrower")]
    public async Task<Response<BorrowerModel>> CreateBorrower([FromBody] BorrowerModel brw)
    {
      return await _service.CreateBorrower(brw);
    }

    // PROCEDURE: Create new loan order
    // POST: post/loan_order
    [HttpPost("loan_order")]
    public async Task<Response<LoanModel>> CreateLoanOrder([FromBody] OrderModel order)
    {
      return await _service.CreateLoanOrder(order);
    }

    // PROCEDURE: Return book according to loan ID
    // POST: post/loan_return
    [HttpPost("loan_return")]
    public async Task<Response<LoanModel>> ReturnBook([FromBody] int loan_id)
    {
      return await _service.ReturnBook(loan_id);
    }
  }
}