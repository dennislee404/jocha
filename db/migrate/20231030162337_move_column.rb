class MoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :product_variants, :variant_id
    add_reference :product_variants, :variant_item, index: true, null: false
  end
end
