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
  def icon_read(color = 'blue-grey-text')
    "<i class=\"material-icons #{color}\">read</i>"
  end

  def icon_feedback(color = 'color1')
    "<i class=\"material-icons #{color}\">send</i>"
  end

  def icon_publish(color = 'green-text')
    "<i class=\"material-icons #{color}\">done</i>"
  end

  def icon_refuse(color = 'red-text')
    "<i class=\"material-icons #{color}\">clear</i>"
  end

  def icon_download(color = 'blue-grey-text')
    "<i class=\"material-icons #{color}\">get-app</i>"
  end

  def icon_warning(color = 'red-text')
    "<i class=\"material-icons #{color}\">warning</i>"
  end

end
