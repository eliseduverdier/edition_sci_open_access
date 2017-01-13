module ApplicationHelper

    # Returns the full title according to the page title
    def full_title(page_title = '')
        site_title = 'OpenAccess'
        site_subtitle = 'Scientific Edition'
        separator = ' | '

        if page_title.empty?
            '{'+site_title+'}'
        else
            page_title + separator + site_title
        end
    end
end
