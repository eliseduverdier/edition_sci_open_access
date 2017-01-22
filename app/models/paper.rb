class Paper < ApplicationRecord
  belongs_to :category

  # Get all authors of a paper
  def get_authors
    list = Array.new()
    authors = Author.where(paper_id: self[:id])
    authors.each do |author|
      list.push(Person.where(id: author.person_id).take)
    end
    return list
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
  #  (if it is not already accepted, and) if its type is reviewable
  def can_be_reviewed?
    %w[article letter other].include? self[:paper_type] # && self[:status] != 1
  end



  def has_reviews?
    Review.where(paper_id: self[:id]).count > 0

  end

end
