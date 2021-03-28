namespace CustomerManagement.Api.Models.Context
{
    using Microsoft.EntityFrameworkCore;

    public class DbPgContext : DomainContext
    {
        public DbPgContext()
        {
        }

        protected override void OnConfiguring(DbContextOptionsBuilder options)
                => options.UseNpgsql("Host=127.0.0.1;Port=5432;Database=;Username=postgres;Password=||env DEVELOPER_PASSWORD||");
    }
}
