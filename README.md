Redmine-Wiki-Repo-Traceability
==============================

http://www.redmine.org/projects/redmine/wiki/Guide#Developer-guide
http://www.redmine.org/projects/redmine/wiki/Plugin_Tutorial

*how the plugin was created + how the rails db was initialized*
ruby script/rails generate redmine_plugin Redmine_Wiki_Repo_Trace
rake db:migrate RAILS_ENV = production
rake redmine:load_default_data RAILS_ENV=production

*steps to get up and running - gonna be a bit different on windows, we'll get to that.*
1. rvm install ruby-1.9.3-p194 -n redmine2  && rvm rubygems 1.8.6 && gem --list
2. gem install bundler && cd setup && bundle install && cd ..
3. rake -f setup/Rakefile build_plugin_env
4. bundle install --without development test
5. ruby script/rails server webrick -e production


