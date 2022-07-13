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
    Task<Response<UserModel>> CreateUserInfo(UserModel user);
    Task<Response<UserModel>> CreateUserToken(UserModel user);
    Task<Response<UserModel>> ClearUserToken(string userEmail);
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
      catch
      {
        response.errorResp();
        throw;
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
      catch
      {
        response.errorResp();
        throw;
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
        throw;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }

    public async Task<Response<UserModel>> CreateUserInfo(UserModel user)
    {
      var response = new Response<UserModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@userFullname", user.userFullname)
          .AddParam("@userEmail", user.userEmail)
          .AddParam("@userPassword", user.userPassword)
          .AddParam("@userRole", user.userRole);
        var userInfo = await _provider.QueryFirstOrDefaultAsync<UserModel>("spUser_Create", param, commandType: CommandType.StoredProcedure);
        response.Data = userInfo;
        response.successResp();
      }
      catch
      {
        response.errorResp();
        throw;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }

    public async Task<Response<UserModel>> CreateUserToken(UserModel user)
    {
      var response = new Response<UserModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@userEmail", user.userEmail)
          .AddParam("@userToken", user.userToken);
        var userInfo = await _provider.QueryFirstOrDefaultAsync<UserModel>("spUserToken_Insert", param, commandType: CommandType.StoredProcedure);
        response.Data = userInfo;
        response.successResp();
      }
      catch
      {
        response.errorResp();
        throw;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }
    public async Task<Response<UserModel>> ClearUserToken(string userEmail)
    {
      var response = new Response<UserModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@userEmail", userEmail);
        var userInfo = await _provider.QueryFirstOrDefaultAsync<UserModel>("spUserToken_Clear", param, commandType: CommandType.StoredProcedure);
        response.Data = userInfo;
        response.successResp();
      }
      catch
      {
        response.errorResp();
        throw;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }
  }
}