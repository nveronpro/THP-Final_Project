class CreateOrderUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_users do |t|
      t.belongs_to :order
      t.belongs_to :user
      t.timestamps
    end
  end
end
