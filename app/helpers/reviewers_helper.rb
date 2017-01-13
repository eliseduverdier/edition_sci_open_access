module ReviewersHelper

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
end
