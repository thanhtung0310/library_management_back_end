using System;
namespace library_management_ba.Entities
{
  using System.ComponentModel.DataAnnotations;
  using System.ComponentModel.DataAnnotations.Schema;
  [Table("tbl_user")]
  public class User
  {
    [Key]
    [NotMapped]
    [Column("userID")]
    public int userID { get; set; }
    [Required]
    [StringLength(200)]
    [Column("userFullname")]
    public string? userFullname { get; set; }
    [Required]
    [StringLength(100)]
    [Column("userEmail")]
    public string? userEmail { get; set; }
    [Required]
    [StringLength(60)]
    [Column("userPassword")]
    public string? userPassword { get; set; }
    [Required]
    [Column("userRole")]
    public int userRole { get; set; }
    [Required]
    [StringLength(200)]
    [Column("userToken")]
    public string? userToken { get; set; }
  }
}