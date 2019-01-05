# ENV['RAILS_ENV'] ||= 'test'
# require_relative '../config/environment'
# require 'rails/test_help'
#
# class ActiveSupport::TestCase
#   # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#   fixtures :all
#
#   # Add more helper methods to be used by all tests here...
# end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
#require "minitest/reporters"
#Minitest::Reporters.use!

class ActiveSupport::TestCase
#  fixtures :all

  def sign_in(user:, password:)
    post user_session_path \
      'user[email]'    => user.email,
      'user[password]' => user.password
  end
end