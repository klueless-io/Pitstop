namespace CustomerManagement.Api.Models.Context
{
  using CustomerManagement.Api.Models.Models;
  using Microsoft.EntityFrameworkCore;

  public partial class DomainContext : DbContext
  {
    public DbSet<Customer> Customers { get; set; }
  }
}
