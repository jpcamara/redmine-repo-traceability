module RedmineRepoTrace
  module Macros
    EXTENSIONS = {
      :rb => "ruby",
      :xml => "xml"
    }

    #source:some/file -- Link to the file located at /some/file in the project's repository
    #source:some/file@52 -- Link to the file's revision 52
    #source:some/file#L120 -- Link to line 120 of the file
    #source:some/file@52#L120 -- Link to line 120 of the file's revision 52
    #source:"some file@52#L120" -- Double quotes can be used when the URL contains spaces
    #source:repo_identifier|some/file -- Link to a file in a repository other than the project default repository.
    #source:"repo_identifier|some file" -- Link to a file in a repository other than the project default repository, with spaces in the path.
    Redmine::WikiFormatting::Macros.register do
      desc "Takes a repo identifier and a path to a repo file, and starts applying maaaaagic."
      macro :repo_src do |wiki, args|
        # usage - {{repo_trace(identifer=identity,file=myfile.rb,style=ruby)}}
        args, options = extract_macro_options(args, :identifier, :file, :style)
        unless options[:file]
          raise 'Must specify a file that is being pulled from the repo'
        end
        options[:style] ||= EXTENSIONS[File.extname(options[:file]).to_sym]

        repo = if options[:identifier]
                 wiki.project.repositories.detect {|repo| repo.identifier == options[:identifier]}
               else
                 wiki.project.repository
               end
        repo_entry = repo.entry(options[:file])
        revision = repo_entry.lastrev

        textilizable("<pre><code class=\"#{options[:style]}\">" + repo.cat(options[:file], revision.identifier) + '</code></pre>')
      end
    end
  end
end