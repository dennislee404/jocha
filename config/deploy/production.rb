set :stage,           :production
set :rails_env,       :production
set :branch,          :main

set :application,     'jocha'
set :deploy_to,       "/home/#{fetch(:user)}/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/sockets/puma.sock"

server '13.213.46.235', user: fetch(:user), roles: [:web, :app, :db], primary: true