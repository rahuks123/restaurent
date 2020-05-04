class MenuItem < ActiveRecord::Base
  belongs_to :menu

  def self.remaining
    all.where("price > 0")
  end
end
