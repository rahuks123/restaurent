class OrdersController < ApplicationController

  def new
    render "orders/new"
  end

  def create
    render plain: "working"
  end
end
