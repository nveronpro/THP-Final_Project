class DropTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :order_items
    drop_table :cart_orders
  end
end
