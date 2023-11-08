class ChangePriceColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :price, if_exists: true   
    add_column :cart_items, :price_cents, :integer, if_not_exists: true
  end
end
