class OptionItem < ApplicationRecord
  belongs_to :option
  has_many :cart_item_options
  has_many :cart_items, through: :cart_item_options
end
