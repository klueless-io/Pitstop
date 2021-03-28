# Called from folder configuration in _initialize.rb
def configure_project_folders(config, target_root)
  puts '_CONFIGURE_PROJECT_FOLDERS'

  config.target_folders.add(:customer_management_api_models                    , File.join(target_root, 'CustomerManagement.Api.Models'))
end
