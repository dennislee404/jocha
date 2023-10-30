class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :min
      t.integer :max
      t.boolean :stackable
      t.string :selection
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
