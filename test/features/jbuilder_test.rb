#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/features/jbuilder_test.rb
#

require 'test_helper'

class JbuilderTest < ActionDispatch::IntegrationTest
  setup do
    Author.create! name: 'aamine'
    nari = Author.create! name: 'nari'
    nari.books.create! title: 'the gc book'
  end

  test 'decorating objects in Jbuilder partials' do
    visit "/authors/#{Author.last.id}.json"
    assert_equal '{"name":"nari","books":[{"author_name":"Nari","title":"the gc book","reverse_title":"koob cg eht"}],"upcased_title":"THE GC BOOK","reverse_title":"koob cg eht"}', page.source
  end
end
