require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano/passenger'
# require 'capistrano/rails/console'

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# require 'capistrano/sidekiq'
# require "whenever/capistrano"
# Load custom tasks from `lib/capistrano/tasks' if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
