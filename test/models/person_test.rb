require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
      @personOk = Person.new(lastname: 'Einstein', email: 'albert@princeton.edu', password: 'abcdefghijkl')
      @personNok_lastname = Person.new(lastname: nil, email: 'albert@princeton.edu', password: 'abcdefghijkl')
      @personNok_email    = Person.new(lastname: 'Einstein', email: 'a@b.c', password: 'abcdefghijkl')
      @personNok_password = Person.new(lastname: 'Einstein', email: 'albert@princeton.edu', password: 'yo')
  end

  test 'should be valid' do
    assert @personOk.valid?
  end

  test 'should be invalid' do
    assert !@personNok_lastname.valid?
    assert !@personNok_email.valid?
    assert !@personNok_password.valid?
  end

end
