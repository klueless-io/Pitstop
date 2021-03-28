namespace CustomerManagement.Api.Context
{
  using Microsoft.EntityFrameworkCore;

  // Database context for MS-SQL database
  public class PgDbContext : DomainContext
  {
    public PgDbContext()
    {
    }

    private string Password
    {
      get
      {
        return System.Environment.GetEnvironmentVariable("DEVELOPER_PASSSWORD");
      }
    }

    protected override void OnConfiguring(DbContextOptionsBuilder options)
            => options.UseNpgsql($"Host=127.0.0.1;Port=5432;Database=CustomerManagement;Username=postgres;Password={Password}");
  }
}
