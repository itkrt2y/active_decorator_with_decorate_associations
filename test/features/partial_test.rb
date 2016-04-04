#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/features/partial_test.rb
#

require 'test_helper'

class PartialTest < ActionDispatch::IntegrationTest
  setup do
    Author.create! name: 'aamine'
    nari = Author.create! name: 'nari'
    nari.books.create! title: 'the gc book'
  end

  test 'decorating implicit @object' do
    visit '/authors'

    # original test
    assert page.has_content? 'the gc book'
    assert page.has_content? 'the gc book'.reverse

    # additional test
    assert page.has_content? 'nari'.capitalize
  end

  test 'decorating implicit @collection' do
    visit '/authors?partial=collection'

    # original test
    assert page.has_content? 'the gc book'
    assert page.has_content? 'the gc book'.reverse

    # additional test
    assert page.has_content? 'nari'.capitalize
  end

  test 'decorating objects in @locals' do
    visit '/authors?partial=locals'

    # original test
    assert page.has_content? 'the gc book'
    assert page.has_content? 'the gc book'.upcase

    # additional test
    assert page.has_content? 'nari'.capitalize
  end
end
