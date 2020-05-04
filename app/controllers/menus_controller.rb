class MenusController < ApplicationController
  def new
    render "menus/new"
  end

  def update
    id = params[:id]
    menu = Menu.find(id)
    menu.active_menu = true
    mepnu.save!
  end
end
