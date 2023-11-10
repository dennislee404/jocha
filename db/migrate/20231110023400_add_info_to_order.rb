class AddInfoToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :hp, :string
  end
end
