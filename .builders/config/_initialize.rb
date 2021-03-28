puts "_INITIALIZED"

KBuilder.reset

Handlebars::Helpers.configure do |config|
  config_file = File.join(Gem.loaded_specs['handlebars-helpers'].full_gem_path, '.handlebars_helpers.json')
  config.helper_config_file = config_file

  string_config_file = File.join(Gem.loaded_specs['handlebars-helpers'].full_gem_path, '.handlebars_string_formatters.json')
  config.string_formatter_config_file = string_config_file
end

target_root       = '~/dev/csharp/Pitstop'
builder_root      = File.expand_path(File.join(target_root, '.builders'))
definition_root   = '~/dev/templates/klue-definitions'
template_root     = '~/dev/templates/klue-templates'

# TODO: It would be useful to have two configurations, one for new code and the other for new builders
KBuilder.configure do |config|
  config.target_folders.add(:solution                           , target_root)
  config.target_folders.add(:builders                           , File.join(target_root, '.builders'))
  config.target_folders.add(:projects                           , File.join(target_root, '.projects'))

  # Individual projects can be targeted here:
  if File.exist?(File.join(builder_root, 'config', '_initialize-project-folders.rb'))
    require 'config/_initialize-project-folders.rb'
    configure_project_folders(config, target_root)
  end
    
  # Where to find templates
  config.template_folders.add(:bin                              , File.join(template_root, 'bin-helpers'))
  config.template_folders.add(:csharp                           , File.join(template_root, 'csharp'))
  config.template_folders.add(:csharp_ef                        , File.join(template_root, 'csharp-ef'))

  # Where to find templates specific to builder definitions
  config.template_folders.add(:definition                       , definition_root)
end

def cfg
  KBuilder.configuration
end

def camel
  require 'handlebars/helpers/string_formatting/camel'
  Handlebars::Helpers::StringFormatting::Camel.new
end

def pluralize
  require 'handlebars/helpers/inflection/pluralize'
  Handlebars::Helpers::Inflection::Pluralize.new
end
