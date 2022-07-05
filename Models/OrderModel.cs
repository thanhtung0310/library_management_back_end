namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations;
  public class OrderModel
  {
    [Required]
    public int book_id { get; set; }
    [Required]
    public int branch_id { get; set; }
    [Required]
    public int borrower_id { get; set; }
  }
}