class OrderItemsController < ApplicationController
  def new
    render "order_items/new"
  end

  def index
  end

  def create
    flash[:notice] = "Item Added to Cart"
    menu_item = MenuItem.find(params[:menu_item_id])
    order = current_user.orders.being_created ?
      current_user.orders.being_created :
      Order.create!(user_id: current_user.id, status: "being created")
    order_item = OrderItem.create!(
      order_id: order.id,
      menu_item_id: menu_item.id,
      menu_item_price: menu_item.price,
      menu_item_name: menu_item.name,
      quantity: params[:quantity],
    )
    redirect_to menu_items_path
  end

  def update
  end

  def destroy
    id = params[:id]
    order = OrderItem.find(id)
    order.destroy
    flash[:notice] = "Item removed from cart"
    redirect_to order_items_path
  end
end
