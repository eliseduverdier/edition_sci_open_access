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
    Reviewer.where(paper_id: self[:id], person_id: person.id)
  end

  

end
