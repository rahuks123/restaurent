class Menu < ActiveRecord::Base
  has_many :menu_items

  def self.current_menu
    menu = find_by(active_menu: true)
    menu
  end
end
