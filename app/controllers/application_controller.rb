class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper
    include ColorHelper

    # CONTROLS USED FOR BEFORE_ACTION

    # Confirms a logged-in user.
    def is_logged_in
      store_location
      unless logged_in?
        redirect_to login_url, :flash => { :error => "Please log in to access to this page!" }
      end
    end


    # Confirms the author of the paper is logged-in user.
    def logged_in_as_correct_user
      if !logged_in?
        store_location
        redirect_to login_url, :flash => { :error => "Please log in to access to this page!" }
      elsif @person != current_user
        redirect_to @paper, :flash => { :error => "You don’t have access to this page!" }
      end
    end

    # Confirms the author of the paper is logged-in user.
    def is_researcher
      unless logged_in? && current_user.is_researcher?
        #redirect_to root_path, :flash => { :error => "You need to be a researcher for this action!" }
        render "static_pages/feedback", :flash => { :error => "You need to be a researcher for this action!" }
      end
    end

    # Confirms the author of the paper is logged-in user.
    def is_editor
      unless logged_in? && current_user.is_editor?
        #redirect_to root_path, :flash => { :error => "You need to be an editor for this action!" }
        render "static_pages/feedback", :flash => { :error => "You need to be an editor for this action!" }
      end
    end

    # Confirms the logged-in user is an editor.
    def is_admin
      unless logged_in? && current_user.is_admin?
        #redirect_to root_path, :flash => { :error => "This page does not exists!" }
        render "static_pages/feedback", :flash => { :error => "This page does not exists!" }
      end
    end

    # Confirms the logged-in user is an reader.
    def is_reader
      unless logged_in? && current_user.is_reader?
        #redirect_to root_path, :flash => { :error => "You need to be a subscribed reader for this action!" }
        render "static_pages/feedback", :flash => { :error => "You need to be a subscribed reader for this action!" }
      end
    end

end
