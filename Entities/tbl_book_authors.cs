using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_book_authors")]
  public class Author
  {
    [Key]
    [NotMapped]
    [Column("book_authors_AuthorID")]

    public int authorID { get; set; }
    [Required]
    [Column("book_authors_BookID")]
    public int? author_BookID { get; set; }
    [Required]
    [StringLength(50)]
    [Column("book_authors_AuthorName")]
    public string? authorName { get; set; }
  }
}