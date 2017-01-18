require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest

  include SessionsHelper

  setup do
    @person = people(:one)
  end

  test "should not get list of all people" do
    get people_url
    assert_redirected_to root_path
  end

  test "Admin should get list of all people" do
    logged_as(people(:admin))
    get people_url
    assert_response :success
  end

  # creates a profile
  test "should get sign up page" do
    get new_person_url
    assert_response :success
  end

  test "should sign up an account" do
    assert_difference('Person.count') do
      post signup, params: { person: {
        email: 'new@mail.com',
        firstname: @person.firstname,
        lastname: @person.lastname,
        password: @person.password,
        status: @person.status
      } }
    end
    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  # edit
  test "should not be able to edit another user" do
    get edit_person_url(@person)
    assert_redirected_to login_path
  end

  test "should be able to edit their own profile" do
    logged_as(@person)
    get edit_person_url(@person)
    assert_response :success
  end

  test "should be able to update their own profile" do
    logged_as(@person)
    patch person_url(@person), params: { person: {
      academia_url: @person.academia_url,
      bio: @person.bio,
      country: @person.country,
      email: 'new@mail.com',
      firstname: @person.firstname,
      lastname: @person.lastname,
      password: @person.password,
      level: @person.level,
      research_gate_url: @person.research_gate_url,
      status: @person.status
    } }
    assert_redirected_to person_url(@person)
  end


  # delete
  test "should not be able to delete another person" do
    delete person_url(@person)
    assert_redirected_to login_path
  end

  test "should be able to delete their own profile" do
    logged_as(@person)
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end
    assert_redirected_to people_url
  end


end
