class SessionsController < ApplicationController

  before_action :logged_in_user, only: [:create, :new, 'signup'] # people#new, session#new,create

  # GET "/login"
  def new
    render 'new'
  end

  # POST "/login"
  def create
    user = Person.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user
    else
        flash[:danger] = 'Invalid email/password combination'
        render 'new'
    end
  end

  # GET "/logout"
  def destroy
    log_out
    redirect_to root_url
  end

  # Confirms a logged-in user.
  def logged_in_user
    if logged_in?
      redirect_to 'static_pages#home', :flash => { :error => "You are already logged in!" }
    end
  end
end
