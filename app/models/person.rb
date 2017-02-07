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
      firstname[0,1] + '. ' + lastname
    else
      firstname + ' ' + lastname
    end
  end

  ##################################################
  #    PERSON STATUS
  ##################################################

  # Checks if the user has the status editor
  def is_editor?
    status == 'editor' || is_admin?
  end

  # Checks if the user has the status admin
  def is_admin?
    status == 'admin'
  end

  # Checks if the user has the status researcher
  def is_researcher?
    status == 'researcher'
  end

  # Checks if the user has the status researcher
  def is_reader?
    status == 'reader'
  end


  ##################################################
  #    RELATIONS TO PAPERS
  ##################################################

  # for current_user

  ##############
  ### ACCESS ###
  ##############
  def can_read?(paper)
    paper.is_published? ||
       logged_in? &&
       (self.wrote?(paper) ||
        self.is_editor? ||
        self.is_reviewer_of?(paper))
  end

  # Returns true if the user wrote the paper
  def wrote?(paper)
    Author.where(person_id: id).nil?
    paper.get_authors.include? self
  end

  ##############
  ### PAPERS ###
  ##############

  # Get all the papers written by a person
  def get_papers
    Author.where(person_id: id).map { |write|
      Paper.where(id: write.paper_id).take
    }
  end


  ###############
  ### REVIEWS ###
  ###############

  # Get all the reviews written by a person
  def get_reviews
    Review.where(reviewer_id: id)
  end

  def get_pending_reviews
    Review.where(reviewer_id: id).where.not(progression: 'done')
  end

  def get_pending_reviews_asked_by_editor
    Review.where(editor_id: id).where.not(progression: 'done')
  end


  # Returns true if the user has to review the paper
  # progression != done
  def should_review?(paper)
    review = paper.get_review_by(self)
    !review.nil? && review.progression == 'pending'
  end

  # Returns true if the user should review the paper
  def is_reviewing?(paper)
    review = paper.get_review_by(self)
    !review.nil? && review.progression == 'ongoing'
  end

  # Returns true if the user reviewed the paper
  def reviewed?(paper)
    review = paper.get_review_by(self)
    !review.nil? && review.progression == 'done'
  end

  # Returns true if the user is reviewer of the paper
  def is_reviewer_of?(paper)
    Review.where(paper_id: paper.id, reviewer_id: id)
  end

  # Returns true if the user is reviewer of the paper
  def is_editor_of?(paper)
    Review.where(paper_id: paper.id, editor_id: id)
  end


  # Returns true if the user is reviewer of the paper
  # FOR THE CURRENT REVIEW-ROUND
  # maybe reviewer with other researchers
  def is_current_reviewer_of?(paper)
    Review.where(
      paper_id: paper.id,
      reviewer_id: id,
      review_round: paper.reviews_count,
    )
  end

  # Returns true if the user is reviewer of the paper
  # FOR THE CURRENT REVIEW-ROUND
  # maybe editor with other editors
  def is_current_editor_of?(paper)
    Review.where(
      paper_id: paper.id,
      editor_id: id,
      review_round: paper.reviews_count,
    )
  end


  # Returns true if the user wrote the review
  def wrote_review?(review)
    review.reviewer_id = id
  end

  # Returns true if the user asked the review
  def asked_review?(review)
    review.reviewer_id = id
  end


  ####################
  ### READING LIST ###
  ####################

  def has_saved?(paper)
    list_ids = ReadingList.where(person_id: id).pluck(:id)
    ReadingListSaves.where(reading_list_id: list_ids).nil?
  end


  private

    # Create the token and digest.
    def create_activation_digest
      self.activation_token  = Person.new_token
      self.activation_digest = Person.digest(activation_token)
      # self.activation_digest = Person.digest(Person.new_token)
    end

end
