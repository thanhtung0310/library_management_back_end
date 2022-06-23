using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_book_copies
  {
    [Key]
    [NotMapped]
    [Display(Name = "Id")]
    public int book_copies_CopiesID { get; set; }
    [Required]
    [Display(Name = "book_id")]
    public int book_copies_BookID { get; set; }
    [Required]
    [Display(Name = "branch_id")]
    public int book_copies_BranchID { get; set; }
    [Required]
    [Display(Name = "number_of_copies")]
    public int book_copies_No_Of_Copies { get; set; }
  }
}