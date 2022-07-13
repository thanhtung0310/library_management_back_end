
namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations;
  using System.ComponentModel.DataAnnotations.Schema;
  public class UserModel
  {
    [Key]
    [NotMapped]
    public int userID { get; }
    public string? userFullname { get; set; }
    [Required]
    public string? userEmail { get; set; }
    public string? userPassword { get; set; }
    public int userRole { get; set; }
    public string? userToken { get; set; }
  }
}