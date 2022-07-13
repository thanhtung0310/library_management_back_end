using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_library_branch")]
  public class Branche
  {
    [Key]
    [NotMapped]
    [Column("library_branch_BranchID")]
    public int branchID { get; set; }
    [Required]
    [StringLength(100)]
    [Column("library_branch_BranchName")]
    public string? branchName { get; set; }
    [Required]
    [StringLength(200)]
    [Column("library_branch_BranchAddress")]
    public string? branchAddr { get; set; }
  }
}