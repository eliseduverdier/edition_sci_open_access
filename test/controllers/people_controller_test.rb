require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  include SessionsHelper

  # skip_before_action :logged_in_as_correct_user, only: [:edit, :edit_password, :update, :destroy]
  # skip_before_action :is_logged_in, only: [:index]
  # skip_before_action :already_logged_in, only: [:new, :create]

  setup do
    @one = people(:one)
    @two = people(:two)
    @editor = people(:editor)
    @admin = people(:admin)
  end

  test "Unlogged user shoud not get list of people" do
    get people_url
    assert_redirected_to login_path
  end

  test "Should get list of researchers and editors" do
    log_in_as(@one)
    get people_url
    assert_response :success
    assert_match 'List of researchers and editors'
  end

  test "Should get a list of everyone" do
    log_in_as(@admin)
    get people_url
    assert_response :success
    assert_match 'List of all users'
  end

  # creates a profile
  test "should get sign up page" do
    get new_person_url
    assert_response :success
  end

  test "should sign up an account" do
    assert_difference('Person.count') do
      post signup_path, params: { person: {
        email: 'new@mail.com',
        firstname: @one.firstname,
        lastname: @one.lastname,
        password: '123456789',
        status: @one.status
      } }
    end
    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@one)
    assert_response :success
  end

  # edit
  test "should not be able to edit another user" do
    log_in_as(@two)
    get edit_person_url(@one)
    assert_redirected_to login_path
  end

  test "should be able to edit their own profile" do
    log_in_as(@one)
    get edit_person_url(@one)
    assert_response :success
  end

  test "should be able to update their own profile" do
    log_in_as(@one)
    patch person_url(@one), params: { person: {
      academia_url: 'academia_url',
      bio: 'bio',
      country: 'country',
      email: 'new@mail.com',
      firstname: @one.firstname,
      lastname: @one.lastname,
      password: 'abcdefghi',
      level: 'level',
      research_gate_url: 'research_gate_url',
    } }
    assert_redirected_to person_url(@one)
  end


  # delete
  test "should not be able to delete another person" do
    delete person_url(@one)
    assert_redirected_to login_path
  end

  test "should be able to delete their own profile" do
    log_in_as(@one)
    assert_difference('Person.count', -1) do
      delete person_url(@one)
    end
    assert_redirected_to people_url
  end


end
