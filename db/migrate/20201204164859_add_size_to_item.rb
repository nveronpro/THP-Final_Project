class AddSizeToItem < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :size, :string
  end
end
