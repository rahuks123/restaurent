class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end
end
