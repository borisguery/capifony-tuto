set :application, "Capifony Symfony 2 Tutorial"
set :deploy_to,   "~/capifony/localhost"
set :app_path,    "app"

set :stages,        %w(production development)
set :default_stage, 'development'
set :stage_dir,     'deployment/stages'
require 'capistrano/ext/multistage'

set :repository,  "~/Workspace/capifony-tuto"
set :scm,         :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

set :model_manager, "doctrine"
# Or: `propel`

set  :keep_releases,  3

# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL

default_run_options[:pty] = true

set :use_composer, true

