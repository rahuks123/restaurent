class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def new
    render "menu_items/new"
  end

  def create
    menu = Menu.current_menu
    MenuItem.create!(
      name: params[:name],
      category: params[:category],
      price: params[:price],
      menu_id: menu.id,
      description: params[:description],
    )
  end

  def destroy
    id = params[:id]
    order = MenuItem.find(id)
    order.destroy
    redirect_to menu_items_path
  end
end
