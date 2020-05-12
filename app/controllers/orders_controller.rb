class OrdersController < ApplicationController
  def new
    render "orders/new"
  end

  def create
  end

  def update
    id = params[:id]
    order = Order.find(id)
    if order.status == "being created"
      order.status = "confirmed"
      order.date = Date.today.to_s(:long)
    elsif order.status == "confirmed"
      order.status = "delivered"
      order.delivered_at = Date.today.to_s(:long)
    end
    order.save!
  end

  def index
    @from_date = params[:from_date]
    @to_date = params[:to_date]
  end
end
