Redmine::Plugin.register :redmine_wiki_repo_trace do
  name 'Redmine Wiki Repo Trace plugin'
  author 'JP Camara, Kurt Barthel, Dave Mulcahey'
  description 'This plugin allows hooking together wikis and source code'
  version '0.0.1'
  url 'https://github.com/jpcamara/Redmine-Wiki-Repo-Traceability'
  author_url 'http://jpcamara.com'
end

Redmine::WikiFormatting::Macros.register do
  desc "Takes a repo identifier and a path to a repo file, and starts applying maaaaagic."
  macro :repo_trace do |obj, args|
    # usage - {{repo_trace(repo_identifier,repo_entry)}}
    # puts obj.inspect --> WikiContent - app/models/wiki_content.rb
    # puts args.inspect --> ["some arg"] - whatever arguments are handed into the macro
    if args.size != 2
      raise 'Must have two arguments: repository identifier, repository file path'
    end
    identifier, file_path = args.shift, args.shift
    repo = Repository.find_by_identifier_param(identifier)
    repo_entry = repo.entry(file_path)
    revision = repo_entry.lastrev
    
    #not showing as formatted text. errrr.
    textilizable('<pre><code class="xml syntaxhl">' + repo.cat(file_path, revision.identifier) + '</code></pre>')
  end
end