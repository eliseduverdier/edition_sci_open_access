module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    # redirect_back_or(root_path)
  end

  # Get current user
  def current_user
    # unless session[:user_id]
    #   redirect_to(login_path)
    # end
    @current_user ||= Person.find_by(id: session[:user_id])
  end

  # def current_user
  #   if (user_id = session[:user_id])
  #     @current_user ||= Person.find_by(id: user_id)
  #   elsif (user_id = cookies.signed[:user_id])
  #     user = Person.find_by(id: user_id)
  #     if user && user.authenticated?(:remember, cookies[:remember_token])
  #       log_in user
  #       @current_user = user
  #     end
  #   end
  # end


  # Returns true if a user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Returns true if the user logged in is the one concerned
  def is_logged_in_user?(user)
    logged_in? && current_user.id == user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  ### When a user tries to access to a page where they need to sign in

  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


end
