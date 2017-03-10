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

  # get current route
  def get_path
    Rails.application.routes.recognize_path(request.original_url)
  end


  # Icons

  def icon_read
    '<i class="material-icons right blue-grey">read</i>'
  end

  def icon_feedback
    '<i class="material-icons right color1">send</i>'
  end

  def icon_publish
    '<i class="material-icons right green-text">done</i>'
  end

  def icon_refuse
    '<i class="material-icons right red-text">clear</i>'
  end


end
