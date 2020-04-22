class Item < ActiveRecord::Base
  belongs_to :user
  def self.remaining
    all.where("quantity > 0")
  end
end
