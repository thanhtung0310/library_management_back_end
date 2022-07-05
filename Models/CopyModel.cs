namespace library_management_ba.Models
{
  public class CopyModel
  {
    public int branch_id { get; }
    public int book_id { get; }
    public int? available_count { get; }
    public int total_count { get; }
  }
}