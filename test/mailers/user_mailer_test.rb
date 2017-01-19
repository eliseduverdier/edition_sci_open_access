require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    user = people(:one)
    user.activation_token = Person.new_token

    mail = UserMailer.account_activation(user)

    assert_match "Account activation", mail.subject
    assert_equal [user.email], mail.to
    # assert_equal ["from@example.com"], mail.from

    # content
    assert_match "Hi",                    mail.body.encoded
    assert_match user.firstname,          mail.body.encoded
    assert_match user.activation_token,   mail.body.encoded
    assert_match CGI.escape(user.email),  mail.body.encoded
  end

  # test "password_reset" do
  #   user = people(:one)
  #   user.activation_token = Person.new_token
  #
  #   mail = UserMailer.password_reset
  #
  #   assert_match "Password reset", mail.subject
  #   assert_equal [user.email], mail.to
  #   # assert_equal ["from@example.com"], mail.from
  #   assert_match "Hi", mail.body.encoded
  # end

end
