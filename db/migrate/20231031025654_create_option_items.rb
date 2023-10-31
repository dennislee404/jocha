class CreateOptionItems < ActiveRecord::Migration[7.0]
  def change
    create_table :option_items do |t|
      t.references :option, null: false, foreign_key: true
      t.string :name
      t.decimal :price, precision: 5, scale: 2, default: 0

      t.timestamps
    end
  end
end
