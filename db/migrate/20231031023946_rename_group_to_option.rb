class RenameGroupToOption < ActiveRecord::Migration[7.0]
  def change
    remove_column :groups, :price
    remove_column :groups, :selection
    rename_table :groups, :options
  end
end
