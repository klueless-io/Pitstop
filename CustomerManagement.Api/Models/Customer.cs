namespace CustomerManagement.Api.Models
{
  using System.Collections.Generic;
  using System.ComponentModel.DataAnnotations.Schema;
  using Microsoft.EntityFrameworkCore;
  // using Microsoft.Extensions.Logging;
  // using Polly;

  public partial class Customer
  {
    // You can write custom methods for Customer in this file.

    // THIS BELONGS IN MIGRATION CODE (SeeEF  )
    // protected override void OnModelCreating(ModelBuilder builder)
    // {
    //   builder.Entity<Customer>().HasKey(m => m.CustomerId);
    //   builder.Entity<Customer>().ToTable("Customer");
    //   base.OnModelCreating(builder);
    // }

    // Not sure where ths belongs
    // public void MigrateDB()
    // {
    //   Policy
    //       .Handle<Exception>()
    //       .WaitAndRetry(10, r => TimeSpan.FromSeconds(10))
    //       .Execute(() => Database.Migrate());
    // }
  }
}
