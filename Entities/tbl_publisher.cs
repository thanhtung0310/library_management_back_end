using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  [Table("tbl_publisher")]
  public class Publisher
  {
    [Key]
    [NotMapped]
    [Column("publisher_PublisherID")]
    public int publisherID { get; set; }
    [Required]
    [StringLength(100)]
    [Column("publisher_PublisherName")]
    public string? publisherName { get; set; }
    [Required]
    [StringLength(200)]
    [Column("publisher_PublisherAddress")]
    public string? publisherAddr { get; set; }
    [Required]
    [StringLength(50)]
    [Column("publisher_PublisherPhone")]
    public string? publisherNum { get; set; }
  }
}