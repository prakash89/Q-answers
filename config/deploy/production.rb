set :stage, :production
set :branch, :master
set :rails_env, :production
set :deploy_to, '/u01/apps/qwinix/q_answers'
set :log_level, :debug

role :app, %w{deploy@54.191.65.34}
role :web, %w{deploy@54.191.65.34}
role :db,  %w{deploy@54.191.65.34}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
server '54.191.65.34', :user => 'deploy', :roles => %w{web app db}
set :ssh_options, {
   #verbose: :debug,
   keys: %w(~/.ssh/id_rsa.pub),
   auth_methods: %w(publickey)
}