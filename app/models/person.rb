class Person < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[^@\s]+@([-a-z0-9]+\.)+[a-z]{2,}\z/i

    # validates :firstname, presence: true
    validates :lastname, presence: true

    validates :email, presence: true,
        format: { with: VALID_EMAIL_REGEX, message: "email format" },
        length: { minimum: 6, maximum: 128 },
        uniqueness: { case_sensitive: false }

    validates :password,
        presence: true,
        length: { minimum: 8, maximum: 256 }

    has_secure_password


    def full_name(initials = false)
        if (initials)
            self[:firstname][0,1] + '. ' + self[:lastname]
        else
            self[:firstname] + ' ' + self[:lastname]
        end
    end

end
