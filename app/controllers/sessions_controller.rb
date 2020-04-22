class SessionsController < ApplicationController
  def new
    render "sessions/new"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "working corectky"
    else
      render plain: "noot working"
    end
  end
end
