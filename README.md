Redmine-Wiki-Repo-Traceability
==============================

Traceability is brutal, and the moment documentation is finished it begins its short road towards irrelevance. Wikis
can help since at least they are trapped behind Office shaped bars, but they can become equally unrelated to code over
time. This is an attempt to start briding the gap by associating wikis with the source code they describe, and provide
some kind of notification when things begin to deviate.

Goals
----------
* Started
** Pull source code into wiki entries for easy viewability (started)
* Not started
** Associate wiki entries with repository code
** Notify (somebody) when source code changes that is related to a wiki

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


rake db:drop db:create db:migrate redmine:plugins:migrate RAILS_ENV=test
rake redmine:load_default_data RAILS_ENV=test
ruby plugins/redmine_wiki_repo_trace/test/unit/wiki_repo_test.rb