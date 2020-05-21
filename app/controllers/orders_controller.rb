class OrdersController < ApplicationController
  def index
    if params[:search_id]
      @report = Order.where("user_id = ?", params[:search_id])
    else
      @report = Order.report(params[:from_date], params[:to_date])
      render "orders/index"
    end
  end

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
      order.save!
    elsif order.status == "confirmed"
      order.status = "delivered"
      order.delivered_at = Date.today.to_s(:long)
      order.save!
      flash[:notice] = "order deleivered"
    end
  end
end
