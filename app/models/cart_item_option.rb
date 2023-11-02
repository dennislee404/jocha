class CartItemOption < ApplicationRecord
  belongs_to :cart_item
  belongs_to :option_item
end