puts "_DATA_APP"

def app
  return @app if defined? @app
  @app = begin
    app = {
      support_mssql: false,
      support_pgsql: true,
      application_namespaces: ['CustomerManagement','Api','Models']
    }
    app[:application_namespace] = app[:application_namespaces].join('.')
    app
  end      
end
