# Goal (Build out all the files for P06, and then do P02)
require 'config/_'

# require 'setup-solution-create-projects' if File

# # puts JSON.pretty_generate(cfg.to_h)
# # puts JSON.pretty_generate(opts.to_h)

# puts JSON.pretty_generate(project_list)
# puts JSON.pretty_generate(active_projects)

# I would prefer to use add_clipboard

# builder.cd(:audit_log).add_file('abc.txt').cd(:solution).add_file('readme.md')
# builder.add_file('abc.txt', folder_key: :audit_log).cd(:solution).add_file('readme.md')

run = 2

refresh_project_list_methods            if run == 1
new_projects(active_projects)           if run == 2
# new_project_builders(active_projects)   if run == 3

#   # file = builder
#   #   .target_file('setup-solution-create-projects.rb')
#   # builder.rc("code #{file}")

