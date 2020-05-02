class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.role = "manager"
    user.save!
    redirect_to users_path
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
