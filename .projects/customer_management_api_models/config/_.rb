puts "_"

require 'config/_initialize'
require 'config/_opinions'
require 'config/_structures'
require 'config/_data'
require 'config/_data-app'
require 'config/_data-entities'

def builder
  @builder ||= KBuilder::BaseBuilder.init
end

def opts
  OpenStruct.new(
    app: app,
    entities: entities
  )
end