class CreateOrdersItems < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_items do |t|
      t.bigint :order_id
      t.bigint :menu_item_id
      t.string :menu_item_name
      t.bigint :menu_item_price
    end
  end
end
