using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_library_branch
  {
    [Key]
    [NotMapped]
    [Display(Name = "branch_id")]
    public int library_branch_BranchID { get; set; }
    [Required]
    [StringLength(100)]
    [Display(Name = "branch_name")]
    public string? library_branch_BranchName { get; set; }
    [Required]
    [StringLength(200)]
    [Display(Name = "branch_address")]
    public string? library_branch_BranchAddress { get; set; }
  }
}