class Variant < ApplicationRecord
	has_many :variant_items, dependent: :destroy

end
