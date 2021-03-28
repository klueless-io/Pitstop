puts "_"

require 'config/_initialize'
require 'config/_opinions'
require 'config/_structures'
require 'config/_projects'
require 'config/_data'
require 'config/_data-projects'
require 'config/_refresh_project_list_methods'

def builder
  @builder ||= KBuilder::BaseBuilder.init
end

def opts
  OpenStruct.new(
    projects: project_list
  )
end