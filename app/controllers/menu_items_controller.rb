class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def new
    render "menu_items/new"
  end

  def create
    menu = Menu.current_menu
    new_item = MenuItem.new(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      menu_id: menu.id,
      description: params[:description],
      image: params[:image],
    )
    if new_item.save
      flash[:notice] = "menu item succefully added"
    else
      flash[:error] = new_item.errors.full_messages.join(" ")
    end
    redirect_to new_menu_path
  end

  def destroy
    id = params[:id]
    order = MenuItem.find(id)
    order.destroy
    flash[:notice] = "Item removed from menu"
    redirect_to menu_items_path
  end
end
