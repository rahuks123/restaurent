class MenuItem < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :category, presence: true

  belongs_to :menu
  has_one_attached :image

  def self.starter
    all.where("category = ?", "starters")
  end

  def self.breakfast
    all.where("category = ?", "breakfast")
  end

  def self.lunch
    all.where("category = ?", "lunch")
  end

  def self.dinner
    all.where("category = ?", "dinner")
  end

  def self.dessert
    all.where("category = ?", "dessert")
  end
end
