class Keyword < ApplicationRecord

  belongs_to :paper, foreign_key: "paper_id"

end
