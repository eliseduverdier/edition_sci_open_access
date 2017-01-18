require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
      @personOk = Person.new(
        firstname: 'Abc', lastname: 'Einstein',
        email: 'albert@princeton.edu', password: 'abcdefghijkl',
        status: 'reader'
      )
      @personNok_lastname = Person.new(
        firstname: 'Abc', lastname: nil,
        email: 'albert@princeton.edu', password: 'abcdefghijkl',
        status: 'reader'
      )
      @personNok_email    = Person.new(
        firstname: 'Abc', lastname: 'Einstein',
        email: 'a@b.c', password: 'abcdefghijkl',
        status: 'reader'
      )
      @personNok_password = Person.new(
        firstname: 'Abc', lastname: 'Einstein',
        email: 'albert@princeton.edu', password: 'yo',
        status: 'reader'
      )
  end

  test 'sign up - should be valid' do
    assert @personOk.valid?
  end

  test 'sign up - should be invalid' do
    assert_not @personNok_lastname.valid?
    assert_not @personNok_email.valid?
    assert_not @personNok_password.valid?
  end

end
