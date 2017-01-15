
class Person < ApplicationRecord

    VALID_EMAIL_REGEX = /\A[^@\s]+@([-a-z0-9]+\.)+[a-z]{2,}\z/i

    # validates :firstname, presence: true
    validates :lastname, presence: true

    validates :email, presence: true,
        format: { with: VALID_EMAIL_REGEX, message: "incorrect format" },
        length: { minimum: 6, maximum: 128 },
        uniqueness: { case_sensitive: false }

    validates :password,
        presence: true,
        length: { minimum: 8, maximum: 256 }

    has_secure_password

    # Get the full name of a person
    # Params:
    # +initials+:: bool  ->   true: J. Smith / false: John Smith
    def full_name(initials = false)
        if (initials)
            self[:firstname][0,1] + '. ' + self[:lastname]
        else
            self[:firstname] + ' ' + self[:lastname]
        end
    end

    # Get all the papers written by a person
    def get_papers
        list = Array.new()
        authors = Author.where(person_id: self[:id])
        authors.each do |write|
          list.push(Paper.where(id: write.paper_id).take)
        end
        return list
    end

    # Returns true if the user wrote the paper
    def wrote?(paper)
      paper.get_authors.include? self
    end

    # Returns true if the user should review the paper
    def is_reviewing?(paper)
      false
    end
    # Returns true if the user reviewed the paper
    def should_review?(paper)
      false
    end

end
