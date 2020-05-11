class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.being_created
    all.where("status = ?", "being created").first
  end
end
