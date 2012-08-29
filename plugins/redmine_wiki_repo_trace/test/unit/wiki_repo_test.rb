require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

class WikiRepoTest < ActionView::TestCase
  include ApplicationHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::SanitizeHelper
  include ERB::Util
  extend ActionView::Helpers::SanitizeHelper::ClassMethods

  fixtures :projects, :roles, :enabled_modules, :users,
                      :repositories, :changesets,
                      :trackers, :issue_statuses, :issues,
                      :versions, :documents,
                      :wikis, :wiki_pages, :wiki_contents,
                      :boards, :messages,
                      :attachments

  def setup
    @project = Project.find(3)
    @repository = Repository::Subversion.create(:project => @project,
             :url => self.class.subversion_repository_url)
    @repository.identifier = 'some_repo' #FIXME probably shouldn't use the identifier if we can't guarantee it'll be there
    @repository.save
    assert @repository
  end

  def teardown
  end
  
  def test_macro_repo_src_should_fail_on_bad_args
    result = textilizable('{{repo_src}}')
    assert_equal '<p><div class="flash error">Error executing the <strong>repo_src</strong> macro (Must have two arguments: repository identifier, repository file path)</div></p>', 
                  result
  end
  
  def test_macro_retrieves_repo_src
    puts @repository.inspect
    result = textilizable('{{repo_src(' + @repository.identifier + ',maven.xml)}}')
    puts result
  end

  # def test_macro_include
  #     @project = Project.find(1)
  #     # include a page of the current project wiki
  #     text = "{{include(Another page)}}"
  #     assert textilizable(text).match(/This is a link to a ticket/)
  # 
  #     @project = nil
  #     # include a page of a specific project wiki
  #     text = "{{include(ecookbook:Another page)}}"
  #     assert textilizable(text).match(/This is a link to a ticket/)
  # 
  #     text = "{{include(ecookbook:)}}"
  #     assert textilizable(text).match(/CookBook documentation/)
  # 
  #     text = "{{include(unknowidentifier:somepage)}}"
  #     assert textilizable(text).match(/Page not found/)
  #   end
end
