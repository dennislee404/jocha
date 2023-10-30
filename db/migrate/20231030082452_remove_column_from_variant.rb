class RemoveColumnFromVariant < ActiveRecord::Migration[7.0]
  def change
    remove_column :variants, :selection
  end
end
