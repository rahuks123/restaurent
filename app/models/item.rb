class Item < ActiveRecord::Base
  def self.remaining
    all.where("quantity > 0")
  end
end
