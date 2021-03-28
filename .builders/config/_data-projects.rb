puts "_PROJECTS"

def all_projects
  project_list
end

def active_projects
  project_list.select { |p| p[:a] == 1 }
end

def project_list
  project_list = [
    { a: 0, type: :library  , key: :api_rest_clients                            , name: 'ApiRestClient'                                                             },
    { a: 0, type: :console  , key: :audit_log                                   , name: 'AuditLog'                                                                  },
    { a: 1, type: :library  , key: :customer_management_api_models              , name: 'CustomerManagement.Api.Models'                                             },
    { a: 0, type: :library  , key: :customer_management_api_dal                 , name: 'CustomerManagement.Api.Dal'                  , variant: :entity_framework  },
    { a: 0, type: :library  , key: :customer_management_api_business            , name: 'CustomerManagement.Api.Business'                                           },
    { a: 0, type: :webapi   , key: :customer_management_api_rest                , name: 'CustomerManagement.Api'                                                    },
    { a: 0, type: :console  , key: :infrastructure_messaging                    , name: 'Infrastructure.Messaging'                                                  },
    { a: 0, type: :library  , key: :invoice_service_models                      , name: 'InvoiceService.Models'                                                     },
    { a: 0, type: :library  , key: :invoice_service_dal                         , name: 'InvoiceService.Dal'                          , variant: :dapper            },
    { a: 0, type: :library  , key: :invoice_service_business                    , name: 'InvoiceService.Business'                                                   },
    { a: 0, type: :console  , key: :invoice_service                             , name: 'InvoiceService'                                                            },
    { a: 0, type: :library  , key: :notification_service_models                 , name: 'NotificationService.Models'                                                },
    { a: 0, type: :library  , key: :notification_service_dal                    , name: 'NotificationService.Dal'                     , variant: :dapper            },
    { a: 0, type: :library  , key: :notification_service_business               , name: 'NotificationService.Business'                                              },
    { a: 0, type: :console  , key: :notification_service                        , name: 'NotificationService'                                                       },
    { a: 0, type: :library  , key: :test_data_utils                             , name: 'TestDataUtils'                                                             },
    { a: 0, type: :console  , key: :time_service                                , name: 'TimeService'                                                               },
    { a: 0, type: :test     , key: :ui_tests                                    , name: 'Ui.Tests'                                    , variant: :entity_framework  },
    { a: 0, type: :library  , key: :vehicle_management_api_models               , name: 'VehicleManagement.Api.Models'                                              },
    { a: 0, type: :library  , key: :vehicle_management_api_dal                  , name: 'VehicleManagement.Api.Dal'                   , variant: :dapper            },
    { a: 0, type: :library  , key: :vehicle_management_api_business             , name: 'VehicleManagement.Api.Business'                                            },
    { a: 0, type: :webapi   , key: :vehicle_management_api                      , name: 'VehicleManagement.Api'                                                     },
    { a: 0, type: :webapp   , key: :webapp                                      , name: 'Webapp'                                                                    },
    { a: 0, type: :test     , key: :workshop_management_api_tests               , name: 'WorkshopManagement.Api.Tests'                                              },
    { a: 0, type: :library  , key: :workshop_management_api_models              , name: 'WorkshopManagement.Api.Models'                                             },
    { a: 0, type: :library  , key: :workshop_management_api_dal                 , name: 'WorkshopManagement.Api.Dal'                  , variant: :dapper            },
    { a: 0, type: :library  , key: :workshop_management_api_business            , name: 'WorkshopManagement.Api.Business'                                           },
    { a: 0, type: :webapi   , key: :workshop_management_api                     , name: 'WorkshopManagement.Api'                                                    },
    { a: 0, type: :library  , key: :workshop_management_event_handler_models    , name: 'WorkshopManagement.EventHandler.Models'                                    },
    { a: 2, type: :library  , key: :workshop_management_event_handler_dal       , name: 'WorkshopManagement.EventHandler.Dal'         , variant: :entity_framework  },
    { a: 0, type: :library  , key: :workshop_management_event_handler_business  , name: 'WorkshopManagement.EventHandler.Business'                                  },
    { a: 0, type: :console  , key: :workshop_management_event_handler           , name: 'WorkshopManagement.EventHandler'                                           }
  ]
  project_list.each do |project|
    project[:namespaces] = project[:name].split('.').map { |name| "'#{name}'"}.join(',')
  end
  project_list
end
