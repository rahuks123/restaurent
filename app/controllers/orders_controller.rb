class OrdersController < ApplicationController
  # belongs_to :user

  def new
    render "orders/new"
  end

  def create
    render plain: "working"
  end
end
