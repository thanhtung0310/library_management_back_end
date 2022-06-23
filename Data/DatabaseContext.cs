using Microsoft.EntityFrameworkCore;
using System.Diagnostics.CodeAnalysis;
using library_management_ba.Entities;

namespace library_management_ba.Data
{
  public class DatabaseContext : DbContext
  {
    public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
    {

    }

    // public DbSet<TodoItem> TodoItems { get; set; } = null!;
    public DbSet<tbl_book>? tbl_book { get; set; }
    public DbSet<tbl_book_authors>? tbl_book_authors { get; set; }
    public DbSet<tbl_book_copies>? tbl_book_copies { get; set; }
    public DbSet<tbl_book_loans>? tbl_book_loans { get; set; }
    public DbSet<tbl_borrower>? tbl_borrower { get; set; }
    public DbSet<tbl_library_branch>? tbl_library_branch { get; set; }
    public DbSet<tbl_publisher>? tbl_publisher { get; set; }
    protected override void OnModelCreating(ModelBuilder builder)
    {
      builder.Entity<tbl_book>()
        .HasKey("book_BookID");
      builder.Entity<tbl_book_authors>()
        .HasKey("book_authors_AuthorID");
      builder.Entity<tbl_book_copies>()
        .HasKey("book_copies_CopiesID");
      builder.Entity<tbl_book_loans>()
        .HasKey("book_loans_LoansID");
      builder.Entity<tbl_borrower>()
        .HasKey("borrower_CardNo");
      builder.Entity<tbl_library_branch>()
        .HasKey("library_branch_BranchID");
      builder.Entity<tbl_publisher>()
        .HasKey("publisher_PublisherID");


      base.OnModelCreating(builder);
    }
  }
}