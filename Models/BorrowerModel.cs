namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations.Schema;
  using System.ComponentModel.DataAnnotations;
  public class BorrowerModel
  {
    [Key]
    [NotMapped]
    public int borrower_id { get; set; }
    [Required]
    public string? borrower_name { get; set; }
    [Required]
    public string? borrower_address { get; set; }
    [Required]
    public string? borrower_contact_number { get; set; }
  }
}