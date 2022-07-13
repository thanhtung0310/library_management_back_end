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

    public DbSet<Book>? Books { get; set; }
    public DbSet<Author>? Authors { get; set; }
    public DbSet<CopiesNumber>? CopiesNumbers { get; set; }
    public DbSet<LoanOrder>? LoanOrders { get; set; }
    public DbSet<Borrower>? Borrowers { get; set; }
    public DbSet<Branche>? Branches { get; set; }
    public DbSet<Publisher>? Publishers { get; set; }
    public DbSet<User>? Users { get; set; }
    protected override void OnModelCreating(ModelBuilder builder)
    {
      builder.Entity<Book>()
        .HasKey("bookID");
      builder.Entity<Borrower>()
        .HasKey("borrowerID");
      builder.Entity<Publisher>()
        .HasKey("publisherID");
      builder.Entity<LoanOrder>()
        .HasKey("loanID");
      builder.Entity<CopiesNumber>()
        .HasKey("copiesID");
      builder.Entity<Author>()
        .HasKey("authorID");
      builder.Entity<Branche>()
        .HasKey("branchID");
      builder.Entity<User>()
        .HasKey("userID");

      base.OnModelCreating(builder);
    }
  }
}