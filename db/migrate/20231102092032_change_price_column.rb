class ChangePriceColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :price    
    add_column :cart_items, :price_cents, :integer
  end
end
