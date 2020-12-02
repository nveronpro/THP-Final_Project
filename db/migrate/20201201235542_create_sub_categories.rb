class CreateSubCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_categories do |t|
      t.integer :duration

      t.timestamps
    end
  end
end
