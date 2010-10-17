set :application, "tinydoc"
set :repository,  "https://johnyerhot@github.com/railsrumble/rr10-team-265.git"
set :user, "deploy"
set :scm_username, "johnyerhot"
set :runner, user
set :branch, "master"

default_run_options[:pty] = true

set :deploy_to, "/apps/#{application}"
set :repository_cache, :remote_cache

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "74.207.225.244"                          # Your HTTP server, Apache/etc
role :app, "74.207.225.244"                          # This may be the same as your `Web` server
role :db,  "74.207.225.244", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
