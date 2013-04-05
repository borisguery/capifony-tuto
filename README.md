capifony-tuto
=============

A step by step Capifony deployment for Symfony2 projects

Step 1 - Create a fresh Symfony 2.1.x project
---------------------------------------------

```bash
$ composer create-project symfony/symfony-standard . 2.1.x-dev
```

Install dependencies

```bash
$ composer install
```

Step 2 - Capify project
-----------------------

Install `capifony` by running:

```bash
$ sudo gem install capifony
```

Then create basic configuration for your project

```bash
$ capify .
```

It should create two files `Capfile` and `app/config/deploy.rb`

For the purpose of this tutorial, and to better organize things, I'm gonna
slightly change the default skeleton

```
$ mkdir deployment/{tasks,stages}
$ mv app/config/deploy.rb deployment/
$ vi Capfile
```
Update `Capfile` to target the new `deployment/deploy.rb` by replacing `load 'app/config/deploy'` with `load 'deployment/deploy'`

Then, we have to set up a minimal but working deployment configuration.

```bash
$ vi deployment/deploy.rb
```

```ruby
set :domain, "localhost"
set :application, "Capifony Symfony 2 Tutorial"
set :deploy_to,   "~/capifony/#{domain}"
set :app_path,    "app"

set :repository,  "~/Workspace/capifony-tuto"
# Set the path to the repository, for this tutorial we use a local repository
# is also accepted

set :scm,         :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `subversion`, `mercurial`, `perforce`, or `none`

set :model_manager, "doctrine"
# Or: `propel`

set  :keep_releases,  3

role :web,        domain                         # Your HTTP server, Apache/etc
role :app,        domain                         # This may be the same as your `Web` server
role :db,         domain, :primary => true       # This is where Symfony2 migrations will run

# Be more verbose by uncommenting the following line
logger.level = Logger::MAX_LEVEL

default_run_options[:pty] = true

set :use_composer, true
```

With the above configuration, capifony will try to `:deploy_to` `~/capifony/localhost` on `:domain` `localhost` using `~/Workspace/capifony-tuto` as `:git` `:repository` and `:use_composer` to install dependencies.

Now, you should be able to run `cap deploy` to start deployment.

It will try to ssh to your localhost using the current user and prompt for your password.

