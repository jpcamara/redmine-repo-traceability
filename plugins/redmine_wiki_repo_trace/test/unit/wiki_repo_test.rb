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
    super
  end

  def teardown
  end
  
  def test_macro_repo_trace_should_fail_on_bad_args
    # begin 
      # textilizable('{{repo_trace}}')
    # rescue => e
      # assert_equals e.message, 'blah'
    # end
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
