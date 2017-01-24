class Paper < ApplicationRecord
  belongs_to :category

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
  #  * if it doesn't have 5 reviews already
  def can_be_reviewed?
    paper_type != 'opinion' && status.to_i < 2 && self.count_reviews < 5
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

  def reviews_done?
    get_reviews
  end



end
