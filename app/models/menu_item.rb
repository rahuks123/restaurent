class MenuItem < ActiveRecord::Base
  belongs_to :menu

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
