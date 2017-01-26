#
# Get colors for different status, etc
#

module ColorHelper

  #################################
  # PAPERS
  #################################
  # paper status
  def paper_get_color_status(status)
    case status.to_i
    when 2 # published
      'green'
    when 3 # refused
      'red'
    when 1, -1, 0
      'grey'
    end
  end

  #################################
  # PEOPLE
  #################################

  #################################
  # REVIEWS
  #################################
  # review status
  def review_get_color_status(status)
    if status.blank?
      'grey'
    elsif status.to_i == 3 # accepted
      'green'
    elsif status.to_i == 2 # minor
      'amber'
    elsif status.to_i == 1 # major
      'orange'
    elsif status.to_i == 0 # refused
      'red'
    end
  end

  # Review progression
  def review_get_color_progression(progression)
    case progression
    when 'pending'
      'grey'
    when 'ongoing'
      'darken-2 orange'
    when 'done'
      'green'
    end
  end

end
