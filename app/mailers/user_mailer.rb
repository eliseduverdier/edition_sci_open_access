class UserMailer < ApplicationMailer

  def account_activation(person)
    @person = person
    mail to: person.email, subject: "OA Edition — Account activation"
  end

  def password_reset
    @person = person
    mail to: person.email, subject: "OA Edition — Password reset"
  end
end
