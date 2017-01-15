module SessionsHelper

    # Logs in the given user.
    def log_in(user)
      session[:user_id] = user.id
    end

    # Get current user
    def current_user
      @current_user ||= Person.find_by(id: session[:user_id])
    end

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
end
