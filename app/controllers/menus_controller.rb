class MenusController < ApplicationController
  def new
    render "menus/new"
  end

  def create
    Menu.create!(
      name: params[:name],
      active_menu: false,
    )
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
