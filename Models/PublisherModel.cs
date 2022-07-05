namespace library_management_ba.Models
{
  using System.ComponentModel.DataAnnotations;
  using System.ComponentModel.DataAnnotations.Schema;
  public class PublisherModel
  {
    [Key]
    [NotMapped]
    public int publisher_id { get; }
    [Required]
    public string? publisher_name { get; }
    [Required]
    public string? publisher_address { get; }
    [Required]
    public string? publisher_contact_number { get; }
    [Required]
    public string? book_title { get; }
  }
}