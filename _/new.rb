# Setup a new solution
solution = builder.new_solution(:pitstop)

# Setup two simple libraries
builder
  .current_solution(solution)
  .new_project_library(:customer_management_api_dal, 
                       name: 'CustomerManagement.Api.Dal',
                       variant: :entity_framework)
  .new_project_library(:customer_management_api_dal, 
                       name: 'WorkshopManagement.EventHandler.Dal',
                       variant: :entity_framework)
