class Review < ApplicationRecord

  belongs_to :paper,  foreign_key: "paper_id"
  belongs_to :person, foreign_key: "reviewer_id"
  belongs_to :person, foreign_key: "editor_id"

end
