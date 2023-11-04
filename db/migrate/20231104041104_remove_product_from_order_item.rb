class RemoveProductFromOrderItem < ActiveRecord::Migration[7.0]
  def change
    remove_column :order_items, :product_id    
    add_column :order_items, :product, :string, null: false
  end
end
