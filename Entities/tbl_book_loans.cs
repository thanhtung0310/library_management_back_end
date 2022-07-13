using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_book_loans")]
  public class LoanOrder
  {
    [Key]
    [NotMapped]
    [Column("book_loans_LoansID")]
    public int loanID { get; set; }
    [Required]
    [Column("book_loans_BookID")]
    public int loan_BookID { get; set; }
    [Required]
    [Column("book_loans_BranchID")]
    public int loan_BranchID { get; set; }
    [Required]
    [Column("book_loans_CardNo")]
    public int loan_BorrowerID { get; set; }
    [Required]
    [StringLength(10)]
    [Column("book_loans_DateOut")]
    public string? loanDate { get; set; }
    [Required]
    [StringLength(10)]
    [Column("book_loans_DueDate")]
    public string? dueDate { get; set; }
    [Required]
    [StringLength(50)]
    [Column("book_loans_Status")]
    public string? loanStatus { get; set; }
  }
}