class CartItem < ActiveRecord::Base
	acts_as_shopping_cart_item_for :cart
  	has_many :cart_item_options
  	has_many :option_items, through: :cart_item_options
end
