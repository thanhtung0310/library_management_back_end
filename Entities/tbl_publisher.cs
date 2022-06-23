using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace library_management_ba.Entities
{
  public class tbl_publisher
  {
    [Key]
    [NotMapped]
    [Display(Name = "publisher_id")]
    public int publisher_PublisherID { get; set; }
    [Required]
    [StringLength(100)]
    [Display(Name = "publisher_name")]
    public string? publisher_PublisherName { get; set; }
    [Required]
    [StringLength(200)]
    [Display(Name = "publisher_address")]
    public string? publisher_PublisherAddress { get; set; }
    [Required]
    [Display(Name = "publisher_contact_number")]
    public string? publisher_PublisherPhone { get; set; }
  }
}