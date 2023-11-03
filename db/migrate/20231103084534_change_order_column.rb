class ChangeOrderColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :user_id    
    add_reference :orders, :user, index:true, null: true
  end
end