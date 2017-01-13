class Reviewer < ApplicationRecord
  belongs_to :person, foreign_key: "person_id"
  belongs_to :paper, foreign_key: "paper_id"
end
