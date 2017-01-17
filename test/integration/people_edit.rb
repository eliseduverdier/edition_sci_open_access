require 'test_helper'

class PeopleEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = Person.new(lastname: 'Abc', email: 'abc@xyz.com', password: 'abcdefghijkl')
  end

  test 'unsuccessful edit' do
    get edit_user_path(@user)
    assert_template 'people/edit'

    patch user_path(@user), params: { user: {
      lastname:  '',
      firstname: '',
      email:     'foo@invalid',
      password:  'foo',
      password_confirmation: 'bar' }
    }

    assert_template 'people/edit'
  end
end
