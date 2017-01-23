module PapersHelper

  # Get the authors IDs of a paper
  def get_authors_id(paper)
    list = []
    authors = paper.get_authors
    authors.each { |author| list.push(author.id) }
    return list
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
    case status.to_i
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


  def get_possible_reviewers_for(paper)
    Person.where(status: 'researcher').where.not(id: get_authors_id(paper)).all
  end

end
