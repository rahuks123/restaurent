class CreateMenuItems < ActiveRecord::Migration[6.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.bigint :menu_id
      t.bigint :price
    end
  end
end
