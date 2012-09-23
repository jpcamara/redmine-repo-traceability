module RedmineRepoTrace
  module Macros
    Redmine::WikiFormatting::Macros.register do
      desc "Takes a repo identifier and a path to a repo file, and starts applying maaaaagic."
      macro :repo_src do |obj, args|
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
  end
end