class Option < ApplicationRecord
	has_many :option_items, dependent: :destroy
	has_many :product_options, dependent: :destroy
end
