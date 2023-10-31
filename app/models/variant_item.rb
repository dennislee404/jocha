class VariantItem < ApplicationRecord
  belongs_to :variant
  has_many :product_variants
end
