class MenuItemsController < ApplicationController
  def index
    render "index"
  end

  def new
    render "menu_items/new"
  end

  def create
    MenuItem.create!(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
  end
end
