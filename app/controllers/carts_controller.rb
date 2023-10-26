class CartsController < ApplicationController
	def index
		@cart = Cart.create
		# @product = Product.find_by(id: params[:product_id])
		# @cart.add(@product, @product.price, params[:quantity])
	end

	def show
		@cart = Cart.create
	end
end