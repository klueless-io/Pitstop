puts "_PROJECTS"

def new_project(folder_key, type, name)
  builder
    .cd(folder_key)
    .rc("dotnet new #{type} -n #{name} -o .")
  
  builder
    .cd(:solution)
    .rc("dotnet sln add #{name}/#{name}.csproj")
    # Need to support the ability to create project specific builders
end

# $ dotnet new lib -o MyLib
# $ dotnet new sln #assuming there is no .sln file yet. if there is, skip this
# $ dotnet sln add MyLib/MyLib.csproj
# $ cd MyConsoleApp
# $ dotnet add reference ../MyLib/MyLib.csproj
#

# def attach_project(folder_key, attach_name)
#   builder
#     .cd(folder_key)
#     .rc("dotnet add reference #{attach_name}/#{attach_name}.csproj")
# end

def new_projects(projects)
  solution_path = builder.target_folder(:solution).gsub('/Users/davidcruwys', '~')
  projects.each do |project|
    new_project_via_config(project)

    opts = {
      solution_path: solution_path,
      project_path: File.join(solution_path, project[:name]),
      project: project
    }

    builder
      .cd(:projects)
      .add_file("#{project[:key]}/setup-project.rb"         , template_file: 'bld-csharp/setup-project.rb', **opts)
      .add_file("#{project[:key]}/config/_.rb"              , template_file: 'bld-csharp/config/_.rb', **opts)
      .add_file("#{project[:key]}/config/_data.rb"          , template_file: 'bld-csharp/config/_data.rb', **opts)
      .add_file("#{project[:key]}/config/_data-app.rb"      , template_file: 'bld-csharp/config/_data-app.rb', **opts)
      .add_file("#{project[:key]}/config/_data-entities.rb" , template_file: 'bld-csharp/config/_data-entities.rb', **opts)
      .add_file("#{project[:key]}/config/_initialize.rb"    , template_file: 'bld-csharp/config/_initialize.rb', **opts)
      .add_file("#{project[:key]}/config/_opinions.rb"      , template_file: 'bld-csharp/config/_opinions.rb', **opts)
      .add_file("#{project[:key]}/config/_structures.rb"    , template_file: 'bld-csharp/config/_structures.rb', **opts)
  end
end

def new_project_via_config(project)
  method = "new_project_#{project[:type]}".to_sym
  send(method, project[:key], project[:name])
end

def new_project_console(folder_key, name)
  new_project(folder_key, :console, name)
end

def new_project_classlib(folder_key, name)
  new_project(folder_key, :classlib, name)
end
alias new_project_library new_project_classlib

def new_project_worker(folder_key, name)
  new_project(folder_key, :worker, name)
end

def new_project_xunit(folder_key, name)
  new_project(folder_key, :xunit, name)
end
alias new_project_test new_project_xunit

def new_project_mvc(folder_key, name)
  new_project(folder_key, :mvc, name)
end
alias new_project_webapp new_project_mvc

def new_project_webapi(folder_key, name)
  new_project(folder_key, :webapi, name)
end

def new_project_grpc(folder_key, name)
  new_project(folder_key, :grpc, name)
end

def new_project_sln(folder_key, name)
  new_project(folder_key, :sln, name)
end

# Templates                                         Short Name          Language          Tags
# --------------------------------------------      --------------      ------------      ----------------------
# Console Application                               console             [C#], F#, VB      Common/Console
# Class library                                     classlib            [C#], F#, VB      Common/Library
# Worker Service                                    worker              [C#], F#          Common/Worker/Web
# Unit Test Project                                 mstest              [C#], F#, VB      Test/MSTest
# NUnit 3 Test Project                              nunit               [C#], F#, VB      Test/NUnit
# NUnit 3 Test Item                                 nunit-test          [C#], F#, VB      Test/NUnit
# xUnit Test Project                                xunit               [C#], F#, VB      Test/xUnit
# Razor Component                                   razorcomponent      [C#]              Web/ASP.NET
# Razor Page                                        page                [C#]              Web/ASP.NET
# MVC ViewImports                                   viewimports         [C#]              Web/ASP.NET
# MVC ViewStart                                     viewstart           [C#]              Web/ASP.NET
# Blazor Server App                                 blazorserver        [C#]              Web/Blazor
# Blazor WebAssembly App                            blazorwasm          [C#]              Web/Blazor/WebAssembly
# ASP.NET Core Empty                                web                 [C#], F#          Web/Empty
# ASP.NET Core Web App (Model-View-Controller)      mvc                 [C#], F#          Web/MVC
# ASP.NET Core Web App                              webapp              [C#]              Web/MVC/Razor Pages
# ASP.NET Core with Angular                         angular             [C#]              Web/MVC/SPA
# ASP.NET Core with React.js                        react               [C#]              Web/MVC/SPA
# ASP.NET Core with React.js and Redux              reactredux          [C#]              Web/MVC/SPA
# Razor Class Library                               razorclasslib       [C#]              Web/Razor/Library
# ASP.NET Core Web API                              webapi              [C#], F#          Web/WebAPI
# ASP.NET Core gRPC Service                         grpc                [C#]              Web/gRPC
# dotnet gitignore file                             gitignore                             Config
# global.json file                                  globaljson                            Config
# NuGet Config                                      nugetconfig                           Config
# Dotnet local tool manifest file                   tool-manifest                         Config
# Web Config                                        webconfig                             Config
# Solution File                                     sln                                   Solution
# Protocol Buffer File                              proto                                 Web/gRPC
