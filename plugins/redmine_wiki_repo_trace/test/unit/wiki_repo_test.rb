# Redmine - project management software
# Copyright (C) 2006-2012  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

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
