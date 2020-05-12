class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  def self.being_created
    all.where("status = ?", "being created").first
  end

  def self.report(from_date, to_date)
    all.where("delivered_at = ? && date = ?", from_date, to_date)
  end
end
