puts "_STRUCTURES"

def structure_docs
  puts 'structure_docs'
  builder
    .add_file('Readme.md' , template_file: 'Readme.md')
    .add_file('docs/CODE_OF_CONDUCT.md'               , template_file: 'docs/CODE_OF_CONDUCT.md')
    .add_file('docs/LICENSE.txt'                      , template_file: 'docs/LICENSE.txt')
    .add_file('docs/STORIES.md'                       , template_file: 'docs/STORIES.md')
    .add_file('docs/USAGE.md'                         , template_file: 'docs/USAGE.md')
end

def structure_ef_context
  puts 'database context'
  builder.add_file('Context/MsDbContext.cs'           , template_file: 'Context/MsDbContext.cs', app: opts.app) if opts.app[:support_mssql]
  builder.add_file('Context/PgDbContext.cs'           , template_file: 'Context/PgDbContext.cs', app: opts.app) if opts.app[:support_pgsql]
  builder.add_file('Context/DomainContext.cs'         , template_file: 'Context/DomainContext.cs', app: opts.app, entities: opts.entities)
  builder.add_file('Context/DomainContext.designer.cs', template_file: 'Context/DomainContext.designer.cs', app: opts.app, entities: opts.entities)
end

def structure_models
  puts 'database models'
  
  opts.entities.each do |entity|
    name = camel.parse(entity[:name].to_s)
    builder.add_file("Models/#{name}.cs"              , template_file: 'Models/Model.cs', app: opts.app, entity: entity)
    builder.add_file("Models/#{name}.designer.cs"     , template_file: 'Models/Model.designer.cs', app: opts.app, entity: entity)
  end
end
