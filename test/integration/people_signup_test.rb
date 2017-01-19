require 'test_helper'

class PeopleSignupTest < ActionDispatch::IntegrationTest

  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "Invalid signup information" do
    get signup_path
    assert_no_difference 'Person.count' do
      post people_path, params: { person: {
        firstname:  "Abcdef",
        lastname:  "Abcdef",
        email: "person@invalid",
        password:              "foo123456",
        password_confirmation: "bar123456"
      } }
      assert_template 'people/new'
    end
  end

  test "Valid signup information" do
    get signup_path
    assert_difference 'Person.count', 1 do
      post people_path, params: { person: {
          firstname:  "Abcdef",
          lastname:  "Abcdef",
          email: "person@mail.com",
          password:              "123456789",
          password_confirmation: "123456789"
      } }

      # mail confirmation
      assert_equal 1, ActionMailer::Base.deliveries.size
      person = assigns(:person)
      assert_not person.activated?
      # Try to log in before activation.
      log_in_as(person)
      assert_not is_logged_in?
      # Invalid activation token
      get edit_account_activation_path("invalid token", email: person.email)
      assert_not is_logged_in?
      # Valid token, wrong email
      get edit_account_activation_path(person.activation_token, email: 'wrong')
      assert_not is_logged_in?
      # Valid activation token
      get edit_account_activation_path(person.activation_token, email: person.email)
      assert person.reload.activated?
      follow_redirect!
      assert_template 'users/show'
      assert is_logged_in?
    end

  end
end
