namespace library_management_ba.Repository
{
  using System.Data;
  using library_management_ba.Models;
  using Dapper;
  using library_management_ba.Repository.Extensions;

  // interface
  public interface IGetService
  {
    Task<Response<List<BookModel>>> GetBookList();
    Task<Response<List<LoanModel>>> GetBookOnLoanList(int borrower_id, int book_id);
    Task<Response<List<LoanModel>>> GetBorrowerOnLoanList(int borrower_id);
    Task<Response<List<LoanModel>>> GetLoanList();
    Task<Response<List<CopyModel>>> GetTotalCopyList();
    Task<Response<List<CopyModel>>> GetTotalCopyByBranchList(int branch_id);
    Task<Response<List<CopyModel>>> GetAvailCopyList();
    Task<Response<List<CopyModel>>> GetAvailCopyByBranchList(int branch_id);
    Task<Response<List<BookModel>>> SearchBook(string search_string);
    Task<Response<List<PublisherModel>>> SearchPublisher(string search_string);
    Task<Response<List<AuthorModel>>> SearchAuthor(string search_string);
    Task<Response<List<UserModel>>> GetUsersList();
    Task<Response<UserModel>> GetUserInfo(string userEmail);
    Task<Response<UserModel>> GetUserPwd(string userEmail);
  }

  // class
  public class GetService : IGetService
  {
    private readonly IDbConnection _provider;
    public GetService(IDbConnection provider) : base()
    {
      _provider = provider;
    }

    public async Task<Response<List<BookModel>>> GetBookList()
    {
      var response = new Response<List<BookModel>>();
      try
      {
        _provider.Open();
        var bookList = await _provider.QueryAsync<BookModel>("spBook_GetAll", commandType: CommandType.StoredProcedure);
        response.Data = bookList.AsList();
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

    public async Task<Response<List<LoanModel>>> GetLoanList()
    {
      var response = new Response<List<LoanModel>>();
      try
      {
        _provider.Open();
        var loanList = await _provider.QueryAsync<LoanModel>("spBookLoans_GetAll", commandType: CommandType.StoredProcedure);
        response.Data = loanList.AsList();
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

    public async Task<Response<List<CopyModel>>> GetTotalCopyList()
    {
      var response = new Response<List<CopyModel>>();
      try
      {
        _provider.Open();
        var copyList = await _provider.QueryAsync<CopyModel>("spTotalBookCopies_GetAll", commandType: CommandType.StoredProcedure);
        response.Data = copyList.AsList();
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

    public async Task<Response<List<CopyModel>>> GetTotalCopyByBranchList(int branch_id)
    {
      var response = new Response<List<CopyModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@branch_id", branch_id);
        var copyList = await _provider.QueryAsync<CopyModel>("spTotalBookCopiesByBranch_GetAll", param, commandType: CommandType.StoredProcedure);
        response.Data = copyList.AsList();
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

    public async Task<Response<List<CopyModel>>> GetAvailCopyList()
    {
      var response = new Response<List<CopyModel>>();
      try
      {
        _provider.Open();
        var copyList = await _provider.QueryAsync<CopyModel>("spAvailBookCopies_GetAll", commandType: CommandType.StoredProcedure);
        response.Data = copyList.AsList();
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

    public async Task<Response<List<CopyModel>>> GetAvailCopyByBranchList(int branch_id)
    {
      var response = new Response<List<CopyModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@branch_id", branch_id);
        var copyList = await _provider.QueryAsync<CopyModel>("spAvailBookCopiesByBranch_GetAll", param, commandType: CommandType.StoredProcedure);
        response.Data = copyList.AsList();
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

    public async Task<Response<List<BookModel>>> SearchBook(string search_string)
    {
      var response = new Response<List<BookModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@search_string", search_string);
        var bookList = await _provider.QueryAsync<BookModel>("spBooks_Search", param, commandType: CommandType.StoredProcedure);
        response.Data = bookList.AsList();
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

    public async Task<Response<List<PublisherModel>>> SearchPublisher(string search_string)
    {
      var response = new Response<List<PublisherModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@search_string", search_string);
        var publisherList = await _provider.QueryAsync<PublisherModel>("spBookPublishers_Search", param, commandType: CommandType.StoredProcedure);
        response.Data = publisherList.AsList();
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

    public async Task<Response<List<AuthorModel>>> SearchAuthor(string search_string)
    {
      var response = new Response<List<AuthorModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@search_string", search_string);
        var authorList = await _provider.QueryAsync<AuthorModel>("spBookPublishers_Search", param, commandType: CommandType.StoredProcedure);
        response.Data = authorList.AsList();
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

    public async Task<Response<List<LoanModel>>> GetBookOnLoanList(int borrower_id, int book_id)
    {
      var response = new Response<List<LoanModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@borrower_id", borrower_id)
          .AddParam("book_id", book_id);
        var loanList = await _provider.QueryAsync<LoanModel>("spBookOnLoans_Get", param, commandType: CommandType.StoredProcedure);
        response.Data = loanList.AsList();
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

    public async Task<Response<List<LoanModel>>> GetBorrowerOnLoanList(int borrower_id)
    {
      var response = new Response<List<LoanModel>>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@borrower_id", borrower_id);
        var loanList = await _provider.QueryAsync<LoanModel>("spBorrowerOnLoans_Get", param, commandType: CommandType.StoredProcedure);
        response.Data = loanList.AsList();
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

    public async Task<Response<List<UserModel>>> GetUsersList()
    {
      var response = new Response<List<UserModel>>();
      try
      {
        _provider.Open();
        var userList = await _provider.QueryAsync<UserModel>("spUsers_GetAll", commandType: CommandType.StoredProcedure);
        response.Data = userList.AsList();
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

    public async Task<Response<UserModel>> GetUserInfo(string userEmail)
    {
      var response = new Response<UserModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@userEmail", userEmail);
        var userInfo = await _provider.QueryFirstOrDefaultAsync<UserModel>("spUser_Get", param, commandType: CommandType.StoredProcedure);
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

    public async Task<Response<UserModel>> GetUserPwd(string userEmail)
    {
      var response = new Response<UserModel>();
      try
      {
        _provider.Open();
        DynamicParameters param = new DynamicParameters()
          .AddParam("@userEmail", userEmail);
        var userInfo = await _provider.QueryFirstOrDefaultAsync<UserModel>("spUserPwd_Get", param, commandType: CommandType.StoredProcedure);
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