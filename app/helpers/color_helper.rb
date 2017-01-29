#
# Get colors for different status, etc
#

module ColorHelper

  #################################
  # PAPERS
  #################################
  # paper status
  def paper_get_color_status(status)
    case status
    when 2 then 'green' # published
    when 3 then 'red' # refused
    when 1, -1, 0 then  'grey'
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
    case status
    when 3 then 'green'  # accepted
    when 2 then 'yellow'  # minor
    when 1 then 'orange' # major
    when 0 then 'red'    # refused
    else 'grey'          # no status yet
    end
  end

  # Review progression
  def review_get_color_progression(progression)
    case progression
    when 'pending' then 'grey'
    when 'ongoing' then 'darken-2 orange'
    when 'done'    then 'green'
    end
  end

end
