class SessionsController < ApplicationController

  before_action :logged_in_user, only: [:create, :new] # people#new, session#new,create

  # GET "/login"
  def new
    render 'new'
  end

  # POST "/login"
  def create
    user = Person.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])

      if user.activated?
        log_in user
        redirect_back_or root_url
      else
        message  = "Your account needs to be activated."
        message += "Please check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end

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

  private

  # Confirms a logged-in user.
  def logged_in_user
    if logged_in?
      redirect_to root_path, :flash => { :error => "You are already logged in!" }
    end
  end

end
