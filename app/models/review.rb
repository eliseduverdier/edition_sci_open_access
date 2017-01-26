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

  ###### CHANGE REVIEWS ATTRIBUTES

  # Does the review have accepted the paper ?
  def accepts_the_paper
    !status.blank? && status.to_i == 3
  end

  # Does the review asked minor diff to the paper ?
  def ask_minor_diff
    !status.blank? && status.to_i == 2
  end

  # Does the review asked major diff to the paper ?
  def ask_major_diff
    !status.blank? && status.to_i == 1
  end

  #  Does the review have refused the paper ?
  def refuse_the_paper
    !status.blank? && status.to_i == 0
  end


  def abort; self.update(progression: 'aborted'); end
  def start; self.update(progression: 'ongoing'); end
  def finish; self.update(progression: 'done'); end



end
