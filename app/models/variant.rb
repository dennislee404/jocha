class Variant < ApplicationRecord
	has_many :variant_items, dependent: :destroy

	VARIANTS = Variant.all.name
end
