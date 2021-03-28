puts "_REFRESH_PROJECT_LIST_METHODS"

def refresh_project_list_methods
  builder
  .cd(:builders)
  .add_file('config/_initialize-project-folders.rb',
    template_file: '_initialize-project-folders.rb',
    projects: active_projects
  )
  .cd(:solution)
end