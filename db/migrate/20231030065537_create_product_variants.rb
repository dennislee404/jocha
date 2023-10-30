class CreateProductVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :product_variants do |t|
      t.references :product, null: false, foreign_key: true
      t.references :variant, null: false, foreign_key: true
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
