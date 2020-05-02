class OrderItemsController < ApplicationController
  def new
    render "order_items/new"
  end

  def index
  end

  def create
    item = MenuItem.find(params[:menu_item_id])
    OrderItem.create!(
      menu_item_id: item.id,
      menu_item_price: item.price,
      menu_item_name: item.name,
    )
    render plain: "working"
  end
end
