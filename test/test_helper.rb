#
# ref: https://github.com/amatsuda/active_decorator/blob/master/test/test_helper.rb
#

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
# load Rails first
require 'rails'

# load the plugin
require 'active_decorator_with_decorate_associations'

# needs to load the app next
require 'fake_app/fake_app'

require 'test/unit/rails/test_help'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

module DatabaseDeleter
  def setup
    Book.delete_all
    Author.delete_all
    Movie.delete_all
    super
  end
end

Test::Unit::TestCase.send :prepend, DatabaseDeleter

CreateAllTables.up unless ActiveRecord::Base.connection.table_exists? 'authors'