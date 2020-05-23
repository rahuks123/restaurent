class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def index
    ensure_user_logged_in
  end

  def edit
    ensure_user_logged_in
    render "users/edit"
  end

  def new
    render "users/new"
  end

  def show
    search_id = params[:search_id]
    @user = User.find(search_id)
  end

  def update
    id = params[:id]
    user = User.find(id)
    user.role = "manager"
    user.save!
    flash[:notice] = "THE USER HAS BEEN UPGRADED"
    redirect_to users_path
  end

  def create
    new_user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      role: "user",
    )
    if new_user.save
      session[:current_user_id] = new_user.id
      redirect_to about_path
    else
      flash[:error] = new_user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end
end
