module PapersHelper

  # Get the authors-of-a-paper IDs
  def get_authors_id(paper)
    paper.get_authors.pluck(:id)
  end

  # Get the reviewers-of-a-paper IDs
  def get_reviewers_id(paper)
    paper.get_reviewers.pluck(:id)
  end

  # Get the list of possible paper types
  def get_paper_types
    [
      'research article',
      'thesis',
      'letter',
      'clinical case study',
      'clinical trial',
      'opinion',
      'review', # can be a public review on an article: no
      'other',
      # 'technical report'
    ]
  end


  def get_paper_status(status)
    case status
    when -1
      'pending (not reviewed)'
    when 0
      'pending (being reviewed)'
    when 1
      'pending (reviewed)'
    when 2
      'published' # accepted
    when 3
      'refused'
    end
  end

  # Get researcher who did not wrote the paper, and are not already  reviewing it
  def get_possible_reviewers_for(paper)
    Person
      .where(status: 'researcher')
      .where.not(id: get_authors_id(paper))
      .where.not(id: get_reviewers_id(paper))
      .all
  end


  def licence_choice
    [
      'CC BY SA',
      'MIT',
      'GNU',
      '...'
    ]
  end

end
