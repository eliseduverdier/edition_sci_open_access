class ReadingList < ApplicationRecord
  belongs_to :person, foreign_key: "person_id"

  def is_public?
    visibility == 1
  end

  def get_papers
    saved_papers_ids = ReadingListSaves.where(id_list: id).all.map { |obj| obj.id }
    Papers.where(id: saved_papers_ids)
  end

end
