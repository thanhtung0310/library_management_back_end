using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_book
  {
    [Key]
    [NotMapped]
    [Display(Name = "book_id")]
    public int book_BookID { get; set; }
    [Required]
    [StringLength(100)]
    [Display(Name = "book_title")]
    public string? book_Title { get; set; }
    [Required]
    [Display(Name = "publisher_id")]
    public int book_PublisherID { get; set; }
  }
}