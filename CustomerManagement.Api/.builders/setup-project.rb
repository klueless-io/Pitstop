# Goal (Build out all the files for P06, and then do P02)
require 'config/_'

run = 42

# puts JSON.pretty_generate(cfg.to_h)
# puts JSON.pretty_generate(opts.to_h)

#  Manually add this to project, todo: Support XML file updates so this can be automated
#  <CodeAnalysisRuleSet>StyleCop.ruleset</CodeAnalysisRuleSet>
# https://marketplace.visualstudio.com/items?itemName=SteveCadwallader.CodeMaid
# https://marketplace.visualstudio.com/items?itemName=c0x3y.StyleCopFixer

opinion_cop                                 if run == 1

# Add entity framework support for database type
if run == 10 
  opinion_add_sql_server                    if opts.app[:support_mssql]
  opinion_add_pgsql                         if opts.app[:support_pgsql]
end

opinion_initialize_secret                   if run == 15

# Documentation files
structure_docs                              if run == 30

builder.add_file('.gitignore', template_file: '.gitignore')

structure_models                            if run == 35

structure_ef_context                        if run == 40

if run == 41
  builder.rc('dotnet ef migrations add Initial --context MsDbContext') if opts.app[:support_mssql]
  builder.rc('dotnet ef migrations add Initial --context PgDbContext') if opts.app[:support_pgsql]
end

if run == 42
  builder.rc('dotnet ef database update --context MsDbContext') if opts.app[:support_mssql]
  builder.rc('dotnet ef database update --context PgDbContext') if opts.app[:support_pgsql]
end

puts 'DONE!'