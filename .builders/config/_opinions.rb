puts "_OPINIONS"

def opinion_add_entity_framework
  builder.run_command('dotnet add package Microsoft.EntityFrameworkCore.Design')
  builder.run_command('dotnet add package Microsoft.EntityFrameworkCore.Tools')
end

def opinion_add_sql_server
  opinion_add_entity_framework
  builder.run_command('dotnet add package Microsoft.EntityFrameworkCore.SqlServer')
end

def opinion_add_pgsql
  opinion_add_entity_framework
  builder.run_command('dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL')
  builder.run_command('dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL.Design')
end

def opinion_initialize_secret
  builder.run_command('dotnet user-secrets init')
  # dotnet user-secrets set "Db:Password" "12345"
end

def opinion_cop
  builder
    .add_file('StyleCop.ruleset', template_file: 'StyleCop.ruleset')
    .run_command('dotnet add package StyleCop.Analyzers')
end
