class CreateOrderItemOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :order_item_options do |t|
      t.string :name
      t.decimal :price, precision: 5, scale: 2
      t.references :order_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
