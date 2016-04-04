#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/features/controller_ivar_test.rb
#

require 'test_helper'

class ControllerIvarTest < ActionDispatch::IntegrationTest
  setup do
    @matz = Author.create! name: 'matz'
    @matz.books.create! title: 'the world of code'
    Author.create! name: 'takahashim'
  end

  test 'decorating a model object in ivar' do
    visit "/authors/#{@matz.id}"

    # original test
    assert page.has_content? 'matz'
    assert page.has_content? 'matz'.capitalize

    # additional test
    assert page.has_content? 'the world of code'.upcase
    assert page.has_content? 'the world of code'.reverse
  end

  test 'decorating model scope in ivar' do
    visit '/authors'

    # original test
    assert page.has_content? 'takahashim'
    assert page.has_content? 'takahashim'.reverse

    # additional test
    assert page.has_content? 'the world of code'.upcase
    assert page.has_content? 'the world of code'.reverse
  end

  test "decorating models' array in ivar" do
    visit '/authors?variable_type=array'

    # original test
    assert page.has_content? 'takahashim'
    assert page.has_content? 'takahashim'.reverse

    # additional test
    assert page.has_content? 'the world of code'.upcase
    assert page.has_content? 'the world of code'.reverse
  end

  test "decorating models' proxy object in ivar" do
    visit '/authors?variable_type=proxy'

    # original test
    assert page.has_content? 'takahashim'
    assert page.has_content? 'takahashim'.reverse

    # additional test
    assert page.has_content? 'the world of code'.upcase
    assert page.has_content? 'the world of code'.reverse
  end

  test 'decorating model association proxy in ivar' do
    visit "/authors/#{@matz.id}/books"

    # original test
    assert page.has_content? 'the world of code'
    assert page.has_content? 'the world of code'.reverse

    # additional test
    assert page.has_content? 'matz'.capitalize
  end
end
