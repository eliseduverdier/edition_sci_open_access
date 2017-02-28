class ReadingListSave < ApplicationRecord
  belongs_to :reading_list, foreign_key: "reading_list_id"
  belongs_to :paper, foreign_key: "paper_id"
end
