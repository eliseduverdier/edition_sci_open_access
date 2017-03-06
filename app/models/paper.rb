class Paper < ApplicationRecord
  belongs_to :category

  # min_reviews = Rails.configuration.options['reviews']['min_reviews']
  # max_reviews = Rails.configuration.options['reviews']['max_reviews']

  #   AUTHORS

  # Get all authors of a paper
  def get_authors
    Author.where(paper_id: id).map { |author|
      Person.where(id: author.person_id).take
    }
  end

  # Format the list of authors
  # Params:
  # +initials+::  +bool+  true: get only the initial of the firstname
  def get_authors_as_name_list(initials: false)
    list = self.get_authors.map { |author|
      author.full_name(initials)
    }
    list.join(', ')
  end

  #####################################
  # REVIEWS
  #####################################

  def get_reviews
    Review.where(paper_id: id).all
  end

  def get_last_reviews
    Review.where(
      paper_id: id,
      review_round: reviews_count
    ).all
  end

  def last_done_reviews
    Review.where(
      paper_id: id,
      review_round: reviews_count,
      progression: 'done'
    ).all
  end

  def get_reviewers
    Review.where(paper_id: id).map { |reviews|
      Person.where(id: reviews.reviewer_id).take
    }
  end

  # Get the review for a given paper and person
  def get_review_by(person)
    Review.where(paper_id: self[:id], reviewer_id: person.id).take
  end


  # REVIEW PROCESS
  ################

  # Returns true if the paper should be reviewed:
  #  * if it is not already accepted
  #  * if its type is reviewable (not an opinion paper for example)
  #  * if it doesn't have <max_reviews> reviews already
  def can_be_reviewed?
    paper_type != 'opinion' &&
        is_under_review? &&
        self.count_reviews < 4
  end


  # Count all the reviews a paper have (all status and progression)
  def count_reviews
    self.get_reviews.count
  end

  # Count the "current" reviews a paper have
  def count_last_reviews
    self.get_last_reviews.count
  end

  # Does the paper have any reviews ?
  def has_reviews?
    self.count_reviews > 0
  end


  # Checks if a paper has more than <min_reviews> reviews,
  #   and all of them are done
  def all_reviews_done?
    reviews = self.get_reviews
    total = reviews.count
    total >= 2 &&
        reviews.where(progression: 'done').count == total
  end

  # Review starteted
  def reviews_started?
    Review.where(paper_id: id, progression: ['ongoing', 'done']).count > 0
  end

  # Returns an average (in %) of the reviews
  # only to indicate the amount of modification that will have to be done
  def get_reviews_score
    reviews = self.get_reviews
    sum = 0.0
    reviews.each { |review| sum += review.status }
    ((sum / (reviews.count * 3) ) * 100).to_i
  end

  def signal_edition_finished
    self.set_to_review
  end


  # STATUS
  ################

  def is_pending_opinion?
    paper_type == 'opinion' && status < 2
  end

  # CALCULATE A PAPER STATUS ACCORDING TO REVIEWS
  def current_reviews_round_done
    Review.where(paper_id: id, review_round: reviews_count)

    if self.all_reviews_done?
      self.update(status: 1)
    end
  end

  def should_be_reviewed?
    need_review == 1
  end

  def set_to_review
    self.update(need_review: 1)
  end

  def set_review_round_done
    self.update(need_review: 0)
  end

  #####################################
  # STATUS
  #####################################

  def publish
    self.update(status: 2)
  end

  def refuse
    self.update(status: 3)
  end

  def is_published?
    status == 2
  end

  def is_under_review?
    status < 2
  end

  def is_refused?
    status == 3
  end

  def is_pending_waiting?
    status == -1
  end

  def is_pending?
    status == 0
  end

  def is_pending_done?
    status == 1
  end

end
