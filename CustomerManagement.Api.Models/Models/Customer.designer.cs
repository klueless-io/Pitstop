namespace CustomerManagement.Api.Models.Models
{
  using System;
  using System.Collections.Generic;

  public partial class Customer
  {
    public int Id { get; set; }

    // Common fields
    public string CustomerId { get; set; }

    public string Name { get; set; }

    public string Address { get; set; }

    public string PostalCode { get; set; }

    public string City { get; set; }

    public string TelephoneNumber { get; set; }

    public string EmailAddress { get; set; }



  }
}
