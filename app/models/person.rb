class Person < ApplicationRecord
    attr_accessor :email
    # validates :firstname, presence: true
    validates :lastname, presence: true

    validates :email, presence: true,
        format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "email format" }

    validates :password,
        presence: true,
        length: { minimum: 8 }
end
