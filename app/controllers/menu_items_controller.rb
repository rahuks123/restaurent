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
      price: params[:price],
      menu_id: menu.id,
      description: params[:description],
    )
  end
end
