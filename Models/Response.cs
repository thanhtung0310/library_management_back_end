namespace library_management_ba
{
  public class Response<T>
  {
    public bool success { get; set; }

    public int errorCode { get; set; }

    public string? message { get; set; }

    public T? Data { get; set; }

    public void successResp()
    {
      success = true;
      errorCode = 0;
      message = "success";
    }

    public void errorResp()
    {
      success = false;
      errorCode = 1;
      message = "error";
    }
  }
}