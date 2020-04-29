class MenuItem < ActiveRecord::Base
  def self.remaining
    all.where("price > 0")
  end
end
