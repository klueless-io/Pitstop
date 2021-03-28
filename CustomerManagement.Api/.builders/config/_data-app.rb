puts "_DATA_APP"

def app
  return @app if defined? @app
  @app = begin
    app = {
      support_mssql: false,
      support_pgsql: true,
      database_name: 'CustomerManagement',
      application_namespaces: ['CustomerManagement','Api']
    }
    app[:application_namespace] = app[:application_namespaces].join('.')
    app
  end      
end
