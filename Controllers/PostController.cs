using Microsoft.AspNetCore.Mvc;
using library_management_ba.Repository;
using library_management_ba.Models;
using library_management_back_end.Controllers;

namespace library_management_ba.Controllers
{
  public class PostController : BaseController
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

    // PROCEDURE: Create new user
    // POST: post/user_info/create
    [HttpPost("user_info/create")]
    public async Task<Response<UserModel>> CreateUserInfo([FromBody] UserModel user)
    {
      return await _service.CreateUserInfo(user);
    }

    // PROCEDURE: Create logged-in token for user
    // POST: post/user_info/create
    [HttpPost("user_info/token/create")]
    public async Task<Response<UserModel>> CreateUserToken([FromBody] UserModel user)
    {
      return await _service.CreateUserToken(user);
    }

    // PROCEDURE: Clear logged-in token for user when log-out
    // POST: post/user_info/create/admin
    [HttpPost("user_info/token/clear/{userEmail}")]
    public async Task<Response<UserModel>> ClearUserToken(string userEmail)
    {
      return await _service.ClearUserToken(userEmail);
    }
  }
}