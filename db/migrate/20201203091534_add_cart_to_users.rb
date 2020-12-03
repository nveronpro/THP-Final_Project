class AddCartToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :cart, foreign_key: true
  end
end
