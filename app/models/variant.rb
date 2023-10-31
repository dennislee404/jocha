class Variant < ApplicationRecord
	has_many :variant_items

	VARIANTS = Variant.all.name
end
