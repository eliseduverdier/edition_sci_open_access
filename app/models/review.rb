class Review < ApplicationRecord

  belongs_to :paper,  foreign_key: "paper_id"
  belongs_to :person, foreign_key: "reviewer_id"
  belongs_to :person, foreign_key: "editor_id"

  # Getters
  def reviewer
    Person.where(id: reviewer_id).take
  end

  def editor
    Person.where(id: editor_id).take
  end

end
