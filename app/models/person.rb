class Person < ApplicationRecord

  attr_accessor :activation_token

  VALID_EMAIL_REGEX = /\A[^@\s]+@([-a-z0-9]+\.)+[a-z]{2,}\z/i

  validates :firstname, presence: true
  validates :lastname, presence: true

  validates :email,
    presence: true,
    format: { with: VALID_EMAIL_REGEX, message: "incorrect format" },
    length: { minimum: 6, maximum: 128 },
    uniqueness: { case_sensitive: false }

  validates :password,
    presence: true,
    length: { minimum: 8, maximum: 256 },
    on: :create

  # digests the password
  has_secure_password

  before_create :create_activation_digest


  ##################################################
  #    LOGIN
  ##################################################

  # Returns the hash digest of the given string.
  def Person.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def Person.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  ##################################################
  #    ATTRIBUTES
  ##################################################

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

  ##################################################
  #    PERSON STATUS
  ##################################################

  # Checks if the user has the status editor
  def is_editor?
    self[:status] == 'editor'
  end

  # Checks if the user has the status admin
  def is_admin?
    self[:status] == 'admin'
  end

  # Checks if the user has the status researcher
  def is_researcher?
    self[:status] == 'researcher'
  end

  # Checks if the user has the status researcher
  def is_reader?
    self[:status] == 'reader'
  end


  ##################################################
  #    RELATIONS TO PAPERS
  ##################################################

  # Get all the papers written by a person
  def get_papers
    list = Array.new()
    authors = Author.where(person_id: self[:id])
    authors.each do |write|
      list.push(Paper.where(id: write.paper_id).take)
    end
    return list
  end

  # Get all the reviews written by a person
  def get_reviews
    Review.where(reviewer_id: self[:id])
  end

  def get_pending_reviews
    Review.where(reviewer_id: id).where.not(progression: 'done')
  end

  def get_pending_reviews_asked_by_editor
    Review.where(editor_id: id).where.not(progression: 'done')
  end


  # Returns true if the user wrote the paper
  def wrote?(paper)
    paper.get_authors.include? self
  end

  # Returns true if the user has to review the paper
  def should_review?(paper)
    review = paper.get_review_by(self)
    !review.nil? && ['pending', '1'].include?(review[:status])
  end

  # Returns true if the user should review the paper
  def is_reviewing?(paper)
    review = paper.get_review_by(self)
    !review.nil? && ['ongoing', '2'].include?(review[:status])
  end

  # Returns true if the user reviewed the paper
  def reviewed?(paper)
    review = paper.get_review_by(self)
    !review.nil? && ['done', '3'].include?(review[:status])
  end

  # Returns true if the user is reviewer of the paper
  def is_reviewer_of?(paper)
    paper.get_review_by(self)
  end


  private

    # Create the token and digest.
    def create_activation_digest
      self.activation_token  = Person.new_token
      self.activation_digest = Person.digest(activation_token)
      # self.activation_digest = Person.digest(Person.new_token)
    end

end
