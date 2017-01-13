class ReadingList < ApplicationRecord
  belongs_to :person, foreign_key: "person_id"
  belongs_to :paper, foreign_key: "paper_id"
  belongs_to :reading_list_folder, foreign_key: "reading_list_folder_id"
end
