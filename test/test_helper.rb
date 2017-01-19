ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  # include SessionsHelper

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Perform action logged as a particular user (from fixtures or tests).
  # +user+ Person to log as
  def logged_as(user)
    session[:user_id] = user.id
    # post login_path, params: { session: { email: user.email, password: user.password } }
  end

end


class ActionDispatch::IntegrationTest

  # include SessionsHelper

  fixtures :all

  # Log in as a particular person.
  def log_in_as(user)
    post login_path, params: { session: { email: user.email, password: user.password } }
  end

end
