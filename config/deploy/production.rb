role :app, %w(dapper@212.140.134.131)
role :db, %w(dapper@212.140.134.131)
set :deploy_to, '/var/www/ccl'
# set :branch, '2.4'
set :branch, `git rev-parse --abbrev-ref HEAD`.strip

server '212.140.134.131',
       user: 'dapper',
       roles: %w{app db},
       ssh_options: {
         user: 'dapper', # overrides user setting above
         forward_agent: false,
         auth_methods: %w(publickey)
       }
