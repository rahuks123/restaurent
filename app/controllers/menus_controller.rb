class MenusController < ApplicationController
  def new
    render "menus/new"
  end

  def update
    menu = Menu.current_menu
    if menu
      menu.active_menu = false
      menu.save!
    end
    id = params[:id]
    menu = Menu.find(id)
    menu.active_menu = true
    menu.save!
    redirect_to menu_items_path
  end
end
