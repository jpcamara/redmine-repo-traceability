require_dependency 'redmine_wiki_trace/macros'

Redmine::Plugin.register :redmine_wiki_repo_trace do
  name 'Redmine Wiki Repo Trace plugin'
  author 'JP Camara, Kurt Barthel, Dave Mulcahey'
  description 'This plugin allows hooking together wikis and source code'
  version '0.0.1'
  url 'https://github.com/jpcamara/redmine-repo-traceability'
  author_url 'http://jpcamara.com'
end