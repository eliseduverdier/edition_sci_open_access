require 'test_helper'

class PeopleSignupTest < ActionDispatch::IntegrationTest
    test "invalid signup information" do
        get signup_path
        assert_no_difference 'Person.count' do
            post people_path, params: { person: {
                name:  "",
                email: "person@invalid",
                password:              "foo",
                password_confirmation: "bar"
            } }
            assert_template 'people/new'
        end
    end

end
