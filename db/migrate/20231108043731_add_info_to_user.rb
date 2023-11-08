class AddInfoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :dob, :datetime
    add_column :users, :age, :integer
    add_column :users, :address, :string
    add_column :users, :points, :decimal, precision: 5, scale: 2, default: 0
  end
end
