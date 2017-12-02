require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rbenv'

set :rails_env,  ENV['on']
set :domain,     '137.74.173.127'
set :deploy_to,  "/srv/www/augment/#{ENV['on']}"
set :repository, 'git@github.com:AnneSottise/augment-kata.git'

set :user,          'deploy'
set :forward_agent, true

set :rbenv_path,   '$HOME/.rbenv'
set :shared_paths, ['config/database.yml', 'log', 'public/uploads']

task :environment do
  if ENV['on']
    invoke :'rbenv:load'
  else
    puts 'No environment specified'
  end
end

task setup: :environment do
  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/log")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/config")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/public/uploads")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/public/uploads")

  queue! %(touch "#{deploy_to}/#{shared_path}/config/database.yml")
  queue %(echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'.")
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  if ENV['on']
    deploy do
      invoke :'git:clone'
      invoke :'deploy:link_shared_paths'
      invoke :'bundle:install'
      invoke :'rails:db_migrate'
      invoke :'rails:assets_precompile'
      invoke :'deploy:cleanup'

      to :launch do
        queue "mkdir -p #{deploy_to}/#{current_path}/tmp/"
        queue "touch #{deploy_to}/#{current_path}/tmp/restart.txt"
      end
    end
  end
end

desc 'Restart Apache'
task :restart do
  queue 'sudo service apache2 restart'
end

desc 'Retrieving logs'
task :logs do
  queue 'echo "Contents of the log file are as follows:"'
  queue 'tail -f /var/log/apache2/error.log'
end

desc 'Seeding db'
task seed: :environment do
  queue %(cd "#{deploy_to}/current")
  queue %(bundle exec rake db:seed RAILS_ENV="#{rails_env}")
end
