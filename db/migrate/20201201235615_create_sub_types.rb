class CreateSubTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_types do |t|
      t.string :specification

      t.timestamps
    end
  end
end
