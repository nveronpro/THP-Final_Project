class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :skip_month?
      
      t.belongs_to :item
      t.timestamps
    end
  end
end
