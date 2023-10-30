class CreateVariantItems < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_items do |t|
      t.references :variant, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
