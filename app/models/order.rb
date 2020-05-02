class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :user

  def self.being_created
    all.where("status == being_created")
  end
end
