Redmine-Wiki-Repo-Traceability
==============================

http://www.redmine.org/projects/redmine/wiki/Guide#Developer-guide
http://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial

how the plugin was created -> ruby script/rails generate redmine_plugin Redmine_Wiki_Repo_Trace

rvm install ruby-1.9.3-p194 -n redmine2  && rvm rubygems 1.8.6 && gem --list

rake -f rake-tasks/Rakefile build_plugin_env

gem install bundler
bundle install --without development test
rake generate_secret_token
rake db:migrate RAILS_ENV=production
rake redmine:load_default_data RAILS_ENV=production
ruby script/rails server webrick -e production


1. download and install http://gembundler.com/
2. bundle install
3. rake build_plugin_env
4. rake generate_secret_token
5. rake db:migrate RAILS_ENV=production
6. rake redmine:load_default_data RAILS_ENV=production
7. ruby script/rails server webrick -e production


