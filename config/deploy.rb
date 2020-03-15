lock "~> 3.12.1"

set :application, "template-capistrano"
set :repo_url, "git@github.com:dorianmariefr/template-capistrano.git"
set :user, "ec2-user"
set :deploy_to, -> { "/home/#{fetch(:user)}/applications/#{fetch(:application)}" }

append :linked_files, '.env.production'
append :linked_dirs, 'tmp/pids', 'tmp/sockets', 'log'
