namespace library_management_ba.Repository
{
  using System.Data;
  using library_management_ba.Models;
  using Dapper;

  // interface
  public interface IService
  {
    Task<Response<List<BookModel>>> GetBookList();
  }

  // class
  public class Service : IService
  {
    private readonly IDbConnection _provider;
    public Service(IDbConnection provider) : base()
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
      catch (Exception ex)
      {
        response.errorResp();
        throw ex;
      }
      finally
      {
        _provider.Close();
      }
      return response;
    }
  }

}