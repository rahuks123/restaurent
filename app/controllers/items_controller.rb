class ItemsController < ApplicationController
  def index
    render "index"
    # render plain: Item.order(:due_date).map{|item| item.to_pleasant_string}.join("\n")
  end
end
