set :user, "aescend"
set :rails_env, "production"
set :delayed_job_workers, 12
append :linked_files, ".env.production"

server "cygnus", :roles => %w(web app cron), :primary => true
server "kagamihara", :roles => %w(web app cron)
server "shima", :roles => %w(web app)
server "saitou", :roles => %w(web app)
server "oogaki", :roles => %w(worker)

set :newrelic_appname, "Danbooru"
after "deploy:finished", "newrelic:notice_deployment"
