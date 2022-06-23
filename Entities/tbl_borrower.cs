using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_borrower
  {
    [Key]
    [NotMapped]
    [Display(Name = "customer_id")]
    public int borrower_CardNo { get; set; }
    [Required]
    [StringLength(100)]
    [Display(Name = "customer_name")]
    public string? borrower_BorrowerName { get; set; }
    [Required]
    [StringLength(200)]
    [Display(Name = "customer_address")]
    public string? borrower_BorrowerAddress { get; set; }
    [Required]
    [StringLength(50)]
    [Display(Name = "customer_contact_number")]
    public string? borrower_BorrowerPhone { get; set; }
  }
}