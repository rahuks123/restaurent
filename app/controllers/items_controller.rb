class ItemsController < ApplicationController
  def index
    render "index"
  end

  def new
    render "items/new"
  end

  def create
    Item.create!(
      name: params[:name],
      quantity: params[:quantity],
      price: params[:price],
    )
  end
end
