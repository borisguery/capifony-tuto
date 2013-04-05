set :application, "Capifony Symfony 2 Tutorial"
set :domain,      "localhost"
set :deploy_to,   "~/capifony/#{domain}"
set :app_path,    "app"

set :repository,  "~/Workspace/capifony-tuto"
set :scm,         :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

set :model_manager, "doctrine"
# Or: `propel`

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Symfony2 migrations will run

set  :keep_releases,  3

# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL

default_run_options[:pty] = true

set :use_composer, true
