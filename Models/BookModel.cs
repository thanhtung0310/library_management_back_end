namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations.Schema;
  using System.ComponentModel.DataAnnotations;
  public class BookModel
  {
    [Key]
    [NotMapped]
    public int book_id { get; }
    [Required]
    public string? book_title { get; }
    [Required]
    public string? author_name { get; }
    [Required]
    public string? publisher_name { get; }
  }
}