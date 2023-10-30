class Variant < ApplicationRecord
	has_many :variant_items
	has_many :product_variants
end
