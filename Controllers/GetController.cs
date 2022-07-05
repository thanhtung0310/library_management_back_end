namespace library_management_ba.Controllers
{
  using Microsoft.AspNetCore.Mvc;
  using library_management_ba.Repository;
  using library_management_ba.Models;
  [Route("[controller]")]
  [ApiController]
  public class GetController : ControllerBase
  {
    private readonly IGetService _service;
    public GetController(IGetService service)
    {
      _service = service;
    }

    // PROCEDURE: Get list of all books
    // GET: get/book_list
    [HttpGet("book_list")]
    public async Task<Response<List<BookModel>>> GetBookList()
    {
      return await _service.GetBookList();
    }

    // PROCEDURE: Get list of all books on loan
    // GET: get/on_loan/book/1/borrower/103
    [HttpGet("on_loan/book/{book_id}/borrower/{borrower_id}")]
    public async Task<Response<List<LoanModel>>> GetBookOnLoanList(int borrower_id, int book_id)
    {
      return await _service.GetBookOnLoanList(borrower_id, book_id);
    }

    // PROCEDURE: Get list of all borrowers borrow books
    // GET: get/on_loan/borrower/103
    [HttpGet("on_loan/borrower/{borrower_id}")]
    public async Task<Response<List<LoanModel>>> GetBorrowerOnLoanList(int borrower_id)
    {
      return await _service.GetBorrowerOnLoanList(borrower_id);
    }

    // PROCEDURE: Get list of all loan orders
    // GET: get/loan_list
    [HttpGet("loan_list")]
    public async Task<Response<List<LoanModel>>> GetLoanList()
    {
      return await _service.GetLoanList();
    }

    // PROCEDURE: Get list of total book copies
    // GET: get/total_copies_list
    [HttpGet("total_copies_list")]
    public async Task<Response<List<CopyModel>>> GetTotalCopyList()
    {
      return await _service.GetTotalCopyList();
    }

    // PROCEDURE: Get list of total book copies by branch
    // GET: get/total_copies_list/1
    [HttpGet("total_copies_list/{branch_id}")]
    public async Task<Response<List<CopyModel>>> GetTotalCopyByBranchList(int branch_id)
    {
      return await _service.GetTotalCopyByBranchList(branch_id);
    }

    // PROCEDURE: Get list of available book copies
    // GET: get/avail_copies_list
    [HttpGet("avail_copies_list")]
    public async Task<Response<List<CopyModel>>> GetAvailCopyList()
    {
      return await _service.GetAvailCopyList();
    }

    // PROCEDURE: Get list of available book copies by branch
    // GET: get/avail_copies_list/1
    [HttpGet("avail_copies_list/{branch_id}")]
    public async Task<Response<List<CopyModel>>> GetAvailCopyByBranchList(int branch_id)
    {
      return await _service.GetAvailCopyByBranchList(branch_id);
    }
  }
}