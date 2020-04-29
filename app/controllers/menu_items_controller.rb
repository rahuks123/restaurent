class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def new
    render "menu_items/new"
  end

  def create
    Menuitem.create!(
      name: params[:name],
      quantity: params[:quantity],
      price: params[:price],
    )
  end
end
