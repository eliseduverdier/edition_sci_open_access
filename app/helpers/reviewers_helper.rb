module ReviewersHelper

    # Get status meaning from number
    def get_status(status)
        if status.to_i == 3
            'Accepted'
        elsif status.to_i == 2
            'Need minor modifications'
        elsif status.to_i == 1
            'Need major modifications'
        elsif status.to_i == 0
            'Refused'
        else
            'Unknown'
        end
    end

    # Get status and their meaning
    def get_hash_status
      {
        3 => 'Accepted',
        2 => 'Need minor modifications',
        1 => 'Need major modifications',
        0 => 'Refused'
      }
    end

    # Get progression and their meaning (not used for now)
    def get_hash_status
      {
        0 => 'pending',
        1 => 'ongoing',
        2 => 'done',
      }
    end

end
