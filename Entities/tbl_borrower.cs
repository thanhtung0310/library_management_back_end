using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_borrower")]
  public class Borrower
  {
    [Key]
    [NotMapped]
    [Column("borrower_CardNo")]
    public int borrowerID { get; set; }
    [Required]
    [StringLength(100)]
    [Column("borrower_BorrowerName")]
    public string? borrowerName { get; set; }
    [Required]
    [StringLength(200)]
    [Column("borrower_BorrowerAddress")]
    public string? borrowerAddr { get; set; }
    [Required]
    [StringLength(50)]
    [Column("borrower_BorrowerPhone")]
    public string? borrowerNum { get; set; }
  }
}