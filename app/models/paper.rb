class Paper < ApplicationRecord
  belongs_to :category

  # min_reviews = Rails.configuration.options['reviews']['min_reviews']
  # max_reviews = Rails.configuration.options['reviews']['max_reviews']

  # Get all authors of a paper
  def get_authors
    list = []
    Author.where(paper_id: id).each do |author|
      list.push(Person.where(id: author.person_id).take)
    end
    return list
  end


  def get_reviewers
    list = []
    Review.where(paper_id: id).each {
      |reviews| list.push(Person.where(id: reviews.reviewer_id).take)
    }
    return list
  end


  def get_reviews
    Review.where(paper_id: id)
  end


  # Get the review for a given paper and person
  def get_review_by(person)
    Review.where(paper_id: self[:id], reviewer_id: person.id).take
  end


  # Format the list of authors
  # Params:
  # +initials+::  +bool+  true: get only the initial of the firstname
  def get_authors_as_name_list(initials: false)
    list = self.get_authors
    people = []
    list.each do |person|
      people.push( person.full_name(initials))
    end
    people.join(', ')
  end


  # Returns true if the paper should be reviewed:
  #  * if it is not already accepted
  #  * if its type is reviewable (not an opinion paper for example)
  #  * if it doesn't have <max_reviews> reviews already
  def can_be_reviewed?
    paper_type != 'opinion' &&
        is_under_review? &&
        self.count_reviews < 4
  end


  # Count the reviews a paper have (all status and progression)
  def count_reviews
    Review.where(paper_id: id).count
  end

  # Does the paper have any reviews ?
  def has_reviews?
    self.count_reviews > 0
  end

  #####################################
  # REVIEW PROCESS
  #####################################

  # Checks if a paper has more than <min_reviews> reviews,
  #   and all of them are done
  def all_reviews_done?
    reviews = Review.where(paper_id: id)
    total = reviews.count
    total > 2 &&
        reviews.where(progression: 'done').count == total
  end

  # Review starteted
  def reviews_started?
    Review.where(paper_id: id, progression: ['ongoing', 'done']).count > 0
  end

  def publish; self.update(status: 2); end

  def refuse; self.update(status: 3); end

  def is_pending_opinion?
    paper_type == 'opinion' && status.to_i < 2
  end

  # Returns an average (in %) of the reviews
  # only to indicate the amount of modification that will have to be done
  def get_reviews_score
    reviews = Review.where(paper_id: id).all
    sum = 0.0
    reviews.each { |review| sum += review.status.to_i }
    ((sum / (reviews.count * 3) ) * 100).to_i
  end

  #####################################
  # STATUS
  #####################################

  def is_published?
    status.to_i == 2
  end

  def is_under_review?
    status.to_i < 2
  end

  def is_refused?
    status.to_i == 3
  end

end
