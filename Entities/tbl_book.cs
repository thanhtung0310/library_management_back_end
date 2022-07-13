using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_book")]
  public class Book
  {
    [Key]
    [NotMapped]
    [Column("book_BookID")]
    public int bookID { get; set; }
    [Required]
    [StringLength(100)]
    [Column("book_Title")]
    public string? bookTitle { get; set; }
    [Required]
    [Column("book_PublisherID")]
    public int book_PublisherID { get; set; }
  }
}