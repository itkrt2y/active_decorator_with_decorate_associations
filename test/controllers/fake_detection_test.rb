#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/controllers/fake_detection_test.rb
#

require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  test 'reveals fakes' do
    movie = Movie.create
    assert_nothing_raised { get :show, id: movie.id }
  end
end
