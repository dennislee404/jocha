class CreateCartItemOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_item_options do |t|
      t.references :cart_item, foreign_key: true
      t.references :option_item, foreign_key: true
      
      t.timestamps
    end
  end
end
