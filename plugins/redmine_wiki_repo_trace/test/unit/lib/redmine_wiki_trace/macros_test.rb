require File.expand_path(File.dirname(__FILE__) + '/../../../../test/test_helper')

class MacrosTest < ActionView::TestCase
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
    @project = Project.find(2)
    @repository = Repository::Subversion.create(:project => @project,
                                                :url => self.class.subversion_repository_url)
    @wiki = @project.wiki
    assert @repository
  end

  def teardown
  end
  
  def test_macro_repo_src_should_fail_on_bad_args
    result = textilizable('{{repo_src}}', :object => @wiki)
    assert_equal '<p><div class="flash error">Error executing the <strong>repo_src</strong> macro (Must specify a file that is being pulled from the repo)</div></p>',
                  result
  end

  def test_macro_retrieves_repo_src
    result = textilizable('{{repo_src(file=.project)}}', :object => @wiki)
    puts result
  end
end
