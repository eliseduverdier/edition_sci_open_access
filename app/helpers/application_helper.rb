module ApplicationHelper

  # Returns the full title according to the page title
  def full_title(page_title = '')
    site_title = 'Open Science'
    separator = ' | '

    if page_title.empty?
      "/ #{site_title} /"
    else
      page_title + separator + site_title
    end
  end

  # compare the current route with the desired one
  def path_is(controller, action)
    Rails.application.routes.recognize_path(request.original_url)[:controller] == controller &&
    Rails.application.routes.recognize_path(request.original_url)[:action] == action
  end

  # compare the current route with the desired one
  def get_path
    Rails.application.routes.recognize_path(request.original_url)
  end


end
