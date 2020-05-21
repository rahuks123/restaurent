class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to about_path
      flash[:notice] = "You Have Succesfully Logged In"
    else
      flash[:error] = "Your login attempt was invalid. Please retry"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    flash[:notice] = "signed out succesfully"
    redirect_to "/"
  end
end
