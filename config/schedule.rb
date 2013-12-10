set :output, "/rails_projects/chef_app/log/cron_log.log"
every :reboot do
	command "cd /rails_projects/chef_app/ && RAILS_ENV=production bin/delayed_job start"
end

every 10.hours do
    command "cd /rails_projects/chef_app/ && RAILS_ENV=production bin/delayed_job restart"
end