# config valid for current version and patch releases of Capistrano
lock "~> 3.15.0"

set :application, "file-uploader"
set :repo_url, "git@github.com:matthewashby/boats-file-uploader.git"

append :linked_files, 'config/database.yml', 'config/credentials/production.key'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/assets', 'public/uploads'

set :rvm_ruby_version, '2.7.0@file-upload'
set :rails_env, 'production'
set :assets_roles, [:app]
set :rails_assets_groups, :assets
set :passenger_restart_with_touch, true

set :keep_releases, 5
set :pty,  false

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after 'deploy:updated', :restart
  # after 'deploy:updated', 'deface:precompile'
  # after 'deface:precompile', :restart
end

# require File.expand_path('../recipes/base', __FILE__)
# require File.expand_path('../recipes/database', __FILE__)
