using System.Data;
namespace library_management_ba.Repository
{
  using library_management_ba.Models;
  using library_management_ba.Repository.Extensions;
  using Dapper;
  using System.Data;
  // interface
  public interface IPostService
  {
    Task<Response<BorrowerModel>> CreateBorrower(BorrowerModel brw);
    Task<Response<LoanModel>> CreateLoanOrder(OrderModel order);
    Task<Response<LoanModel>> ReturnBook(int loan_id);
  }

  // class
  public class PostService : IPostService
  {
    private readonly IDbConnection _provider;
    public PostService(IDbConnection provider) : base()
    {
      _provider = provider;
    }

    public async Task<Response<BorrowerModel>> CreateBorrower(BorrowerModel brw)
    {
      var response = new Response<BorrowerModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
            .AddParam("@borrower_name", brw.borrower_name)
            .AddParam("@borrower_address", brw.borrower_address)
            .AddParam("@borrower_contact_number", brw.borrower_contact_number);
        var newBorrower = await _provider.QueryFirstOrDefaultAsync<BorrowerModel>("spBorrower_Insert", param, commandType: CommandType.StoredProcedure);
        response.Data = newBorrower;
        response.successResp();
      }
      catch (Exception ex)
      {
        response.errorResp();
        // throw ex;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }

    public async Task<Response<LoanModel>> CreateLoanOrder(OrderModel order)
    {
      var response = new Response<LoanModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
            .AddParam("@book_id", order.book_id)
            .AddParam("@branch_id", order.branch_id)
            .AddParam("@borrower_id", order.borrower_id);
        var newOrder = await _provider.QueryFirstOrDefaultAsync<LoanModel>("spBookLoans_Insert", param, commandType: CommandType.StoredProcedure);
        response.Data = newOrder;
        response.successResp();
      }
      catch (Exception ex)
      {
        response.errorResp();
        // throw ex;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }

    public async Task<Response<LoanModel>> ReturnBook(int loan_id)
    {
      var response = new Response<LoanModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
            .AddParam("@loan_id", loan_id);
        var newOrder = await _provider.QueryFirstOrDefaultAsync<LoanModel>("spBookLoans_Return", param, commandType: CommandType.StoredProcedure);
        response.Data = newOrder;
        response.successResp();
      }
      catch
      {
        response.errorResp();
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }
  }
}