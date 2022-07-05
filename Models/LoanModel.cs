namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations.Schema;
  using System.ComponentModel.DataAnnotations;
  public class LoanModel
  {
    [Key]
    [NotMapped]
    public int loan_id { get; }
    [Required]
    public string? book_title { get; }
    [Required]
    public string? borrower_name { get; }
    [Required]
    public string? borrower_contact_number { get; }
    [Required]
    public string? loan_date { get; }
    [Required]
    public string? due_date { get; }
    [Required]
    public string? branch_name { get; }
  }
}