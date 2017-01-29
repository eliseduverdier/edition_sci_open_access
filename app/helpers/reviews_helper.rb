module ReviewsHelper

    # Get status meaning from number
    def get_review_status(status)
        case status
        when 3 then 'Accepted'
        when 2 then 'Need minor modifications'
        when 1 then 'Need major modifications'
        when 0 then 'Refused'
        else '?'
        end
    end

end
