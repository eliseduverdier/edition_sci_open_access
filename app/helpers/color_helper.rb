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
    case status.to_i
    when 3 # accepted
      'green'
    when 2
      'yellow'
    when 1
      'orange'
    when 0
      'red'
    end
  end

  # Review progression
  def review_get_color_progression(progression)
    case progression
    when 'pending'
      'grey'
    when 'ongoing'
      'yellow darken-2'
    when 'done'
      'green'
    end
  end

end
