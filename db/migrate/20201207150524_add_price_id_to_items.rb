class AddPriceIdToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :price_id, :string
  end
end
