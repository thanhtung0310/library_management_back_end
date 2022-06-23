using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_book_loans
  {
    [Key]
    [NotMapped]
    [Display(Name = "Id")]
    public int book_loans_LoansID { get; set; }
    [Required]
    [Display(Name = "book_id")]
    public int book_loans_BookID { get; set; }
    [Required]
    [Display(Name = "branch_id")]
    public int book_loans_BranchID { get; set; }
    [Required]
    [Display(Name = "customer_id")]
    public int book_loans_CardNo { get; set; }
    [Required]
    [StringLength(50)]
    [Display(Name = "loan_date")]
    public string? book_loans_DateOut { get; set; }
    [Required]
    [StringLength(50)]
    [Display(Name = "loan_date")]
    public string? book_loans_DueDate { get; set; }
    [Required]
    [StringLength(50)]
    [Display(Name = "loan_status")]
    public string? book_loans_Status { get; set; }
  }
}