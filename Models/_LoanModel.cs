namespace library_management_ba.Models
{
  public class LoanModel
  {
    public int loan_id { get; }
    public string? book_title { get; }
    public string? borrower_name { get; }
    public string? borrower_contact_number { get; }
    public string? loan_date { get; }
    public string? due_date { get; }
    public string? branch_name { get; }
  }
}