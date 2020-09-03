lock "~> 3.14.1"

set :application, "nevereatalone"
set :repo_url, "git@github.com:dorianmariefr/nevereatalone.git"
set :user, "ec2-user"
set :deploy_to, -> { "/home/#{fetch(:user)}/applications/#{fetch(:application)}" }

append :linked_files, ".env.production", ".env.staging"
append :linked_dirs, 'tmp/pids', 'tmp/sockets', 'log'

set :format_options, truncate: false

before "deploy:assets:precompile", "deploy:yarn_install"

namespace :deploy do
  desc 'Run rake yarn:install'
  task :yarn_install do
    on roles(:web) do
      within release_path do
        execute("cd #{release_path} && yarn install")
      end
    end
  end
end
