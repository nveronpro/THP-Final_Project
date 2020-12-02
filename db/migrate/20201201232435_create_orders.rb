class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :duration
      t.boolean :skip_month?
      
      t.timestamps
    end
  end
end
