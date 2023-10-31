class ProductVariant < ApplicationRecord
  belongs_to :product
  belongs_to :variant_item
end
