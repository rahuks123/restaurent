class MenusController < ApplicationController
  def new
    render "menus/new"
  end

  def create
    menu = Menu.create(
      name: params[:name],
      active_menu: false,
    )
    if menu.save!
      flash[:notice] = "MENU ITEM SUCCESFULLY ADDED"
    else
      flash[:error] = "MENU WAS NOT ADDED"
    end
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
