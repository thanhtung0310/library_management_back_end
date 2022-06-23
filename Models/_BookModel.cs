using System.ComponentModel.DataAnnotations;

namespace library_management_ba.Models
{
  public class BookModel
  {
    public int book_id { get; }
    public string? book_title { get; }
    public string? author_name { get; }
    public string? publisher_name { get; }
  }
}