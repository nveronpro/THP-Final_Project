class CreateItemCarts < ActiveRecord::Migration[6.0]
  def change
    create_table :item_carts do |t|
      t.belongs_to :cart
      t.belongs_to :item
      t.timestamps
    end
  end
end
