namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations;
  using System.ComponentModel.DataAnnotations.Schema;
  public class AuthorModel
  {
    [Key]
    [NotMapped]
    public int author_id { get; }
    [Required]
    public string? author_name { get; }
    [Required]
    public string? book_title { get; }
    [Required]
    public string? publisher_name { get; }

  }
}