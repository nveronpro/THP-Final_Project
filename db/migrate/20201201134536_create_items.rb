class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price

      t.belongs_to :sub_category
      t.belongs_to :sub_type
      t.timestamps
    end
  end
end
