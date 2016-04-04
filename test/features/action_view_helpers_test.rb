#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/features/action_view_helpers_test.rb
#

require 'test_helper'

class ActionViewHelpersTest < ActionDispatch::IntegrationTest
  setup do
    aamine = Author.create! name: 'aamine'
    @rhg = aamine.books.create! title: 'RHG'
    @rhg_novel = aamine.books.create! title: 'RHG Novel', type: 'Novel'
  end

  test 'invoking action_view helper methods' do
    visit "/authors/#{@rhg.author.id}/books/#{@rhg.id}"

    # original test
    within 'a.title' do
      assert page.has_content? 'RHG'
    end
    assert page.has_css? 'img'

    # additional test
    assert page.has_content? 'aamine'.capitalize
  end

  test 'invoking action_view helper methods on model subclass' do
    visit "/authors/#{@rhg_novel.author.id}/books/#{@rhg_novel.id}"

    # original test
    within 'a.title' do
      assert page.has_content? 'RHG Novel'
    end
    assert page.has_css? 'img'

    # additional test
    assert page.has_content? 'aamine'.capitalize
  end

  test 'invoking action_view helper methods in rescue_from view' do
    visit "/authors/#{@rhg.author.id}/books/#{@rhg.id}/error"

    # original test(modified)
    assert page.has_content? 'ERROR: Book'

    # additional test
    assert page.has_content? 'ERROR: Author'
  end

  test 'make sure that action_view + action_mailer works' do
    visit "/authors/#{@rhg.author.id}/books/#{@rhg.id}"
    click_link 'purchase'
    assert page.has_content? 'done'
  end
end