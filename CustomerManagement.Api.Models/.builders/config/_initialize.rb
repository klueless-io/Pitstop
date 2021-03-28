puts "_INITIALIZED"

KBuilder.reset

Handlebars::Helpers.configure do |config|
  config_file = File.join(Gem.loaded_specs['handlebars-helpers'].full_gem_path, '.handlebars_helpers.json')
  config.helper_config_file = config_file

  string_config_file = File.join(Gem.loaded_specs['handlebars-helpers'].full_gem_path, '.handlebars_string_formatters.json')
  config.string_formatter_config_file = string_config_file
end

target_root       = '~/dev/csharp/Pitstop/CustomerManagement.Api.Models'
templates_root    = '~/dev/templates/klue-templates'

KBuilder.configure do |config|
  config.target_folders.add(:app, target_root)

  # config.template_folders.add(:global , templates_global)
  # General C#
  config.template_folders.add(:csharp     , File.join(templates_root, 'csharp'))

  # Entity framework
  config.template_folders.add(:csharp_ef  , File.join(templates_root, 'csharp-ef'))
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
