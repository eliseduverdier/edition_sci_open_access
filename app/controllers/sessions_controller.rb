class SessionsController < ApplicationController

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
end
