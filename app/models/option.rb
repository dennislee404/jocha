class Option < ApplicationRecord
	has_many :option_items
	has_many :product_options
end
