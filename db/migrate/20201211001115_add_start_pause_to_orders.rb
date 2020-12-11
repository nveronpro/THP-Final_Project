class AddStartPauseToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :start_pause, :datetime
    add_column :orders, :end_pause, :datetime
  end
end
