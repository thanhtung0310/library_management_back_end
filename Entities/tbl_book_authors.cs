using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_book_authors
  {
    [Key]
    [NotMapped]
    [Display(Name = "author_id")]

    public int book_authors_AuthorID { get; set; }
    [Required]
    [Display(Name = "book_id")]
    public int? book_authors_BookID { get; set; }
    [Required]
    [StringLength(50)]
    [Display(Name = "author_name")]
    public string? book_authors_AuthorName { get; set; }
  }
}