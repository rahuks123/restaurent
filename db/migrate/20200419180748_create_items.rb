class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :name
      t.decimal :price
    end
  end
end
