class ReadingList < ApplicationRecord
  belongs_to :person, foreign_key: "person_id"

  def is_public?
    visibility == 1
  end

  def get_papers
    saved_papers_ids = ReadingListSave.where(reading_list_id: id).pluck(:id)
    Papers.where(id: saved_papers_ids)
  end

  def include_paper(paper)
    ReadingListSave.where(reading_list_id: id, paper_id: paper.id).count > 0
  end

end
