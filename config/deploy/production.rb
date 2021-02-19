role :app, %w(rightwebdesign@195.171.242.174)
role :db, %w(rightwebdesign@195.171.242.174)
set :deploy_to, '/var/www/file-upload'
set :rails_env, 'production'
set :branch, 'master'
server '195.171.242.174',
       user: 'rightwebdesign',
       roles: %w{app db },
       ssh_options: {
         user: 'rightwebdesign', # overrides user setting above
         forward_agent: false,
         auth_methods: %w(publickey)
       }