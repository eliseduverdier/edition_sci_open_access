ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
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
  end

  # helper method
  def sign_in_as(name)
    post login_url, params: { sig: people(name).perishable_signature }
  end


  # Log in as a particular user.
  # +user+      User to log as
  # +password+  Password's user
  def log_in_as(user, password: 'azertyuiop')
    post login_path, params: { session: { email: user.email, password: password } }
  end

end


class ActionDispatch::IntegrationTest


  fixtures :all

  # Log in as a particular user.
  # +user+      User to log as
  # +password+  Password's user
  def log_in_as(user, password: 'azertyuiop')
    post login_path, params: { session: { email: user.email, password: password } }
  end

end
