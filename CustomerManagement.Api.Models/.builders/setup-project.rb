# Goal (Build out all the files for P06, and then do P02)
require 'config/_'

run = 40

# puts JSON.pretty_generate(cfg.to_h)
# puts JSON.pretty_generate(opts.to_h)

#  Manually add this to project, todo: Support XML file updates so this can be automated
#  <CodeAnalysisRuleSet>StyleCop.ruleset</CodeAnalysisRuleSet>

opinion_cop                                 if run == 1

# Add entity framework support for database type
if run == 10 
  opinion_add_sql_server                    if opts.app[:support_mssql]
  opinion_add_pgsql                         if opts.app[:support_pgsql]
end

opinion_initialize_secret                   if run == 15

# Documentation files
structure_docs                              if run == 30

if run == 40
  structure_models                            
  structure_context                         # Entity framework context files

  builder.rc('dotnet ef migrations add Initial --context MsDbContext') if opts.app[:support_mssql]
  builder.rc('dotnet ef migrations add Initial --context PgDbContext') if opts.app[:support_pgsql]
end

  # .add_file('person.rb',
  #   template_file: 'model.rb',
  #   name: 'person',
  #   fields: %i[first_name last_name])

  # file = builder.target_file('main.rb')
  # puts file
  # puts File.exist?(file)
  # system("code #{file}")
  # puts 'basic'

puts 'DONE!'