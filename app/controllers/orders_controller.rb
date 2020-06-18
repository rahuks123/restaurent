class OrdersController < ApplicationController
  def index
    if params[:search_id] && params[:from_date].blank? || params[:to_date].blank?
      @report = Order.per_user(params[:search_id])
    elsif params[:from_date].blank? || params[:to_date].blank?
      flash[:error] = "please enter the dates column"
      redirect_to reports_path
    elsif params[:search_id].blank?
      @report = Order.report(params[:from_date], params[:to_date])
      render "orders/index"
    else
      orders = Order.report(params[:from_date], params[:to_date])
      @report = orders.where("user_id = ?", params[:search_id])
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
      flash[:notice] = "items succesfully ordered"
      redirect_to order_items_path
    elsif order.status == "confirmed"
      order.status = "delivered"
      order.delivered_at = Date.today.to_s(:long)
      order.save!
      flash[:notice] = "order deleivered"
      redirect_to new_order_path
    end
  end
end
