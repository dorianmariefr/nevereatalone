lock "~> 3.12.1"

set :application, "dorianmarie.fr"
set :repo_url, "git@github.com:dorianmariefr/dorianmarie.fr.git"
set :user, "ec2-user"
set :deploy_to, -> { "/home/#{fetch(:user)}/applications/#{fetch(:application)}" }

append :linked_files, '.env.production'
append :linked_dirs, 'tmp/pids', 'tmp/sockets', 'log'

set :format_options, truncate: false
