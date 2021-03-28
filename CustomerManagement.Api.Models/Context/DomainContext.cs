namespace CustomerManagement.Api.Models.Context
{
  using Microsoft.EntityFrameworkCore;
  using CustomerManagement.Api.Models.Models;

  public class DomainContext : DbContext
  {
    public DbSet<Customer> Customers { get; set; }

  }
}
