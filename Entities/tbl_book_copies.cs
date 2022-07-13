using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_book_copies")]
  public class CopiesNumber
  {
    [Key]
    [NotMapped]
    [Column("book_copies_CopiesID")]
    public int copiesID { get; set; }
    [Required]
    [Column("book_copies_BookID")]
    public int copies_BookID { get; set; }
    [Required]
    [Column("book_copies_BranchID")]
    public int copies_BranchID { get; set; }
    [Required]
    [Column("book_copies_No_Of_Copies")]
    public int copiesNum { get; set; }
  }
}