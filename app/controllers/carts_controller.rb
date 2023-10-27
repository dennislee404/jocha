class CartsController < ApplicationController
	before_action :extract_shopping_cart

	def create
		@product = Product.find(params[:id])
		binding.break
		if @cart.add(@product, @product.price, params[:quantity])
			redirect_to cart_path
		end
	end

	def show

	end

	private
	def extract_shopping_cart
		cart_id = session[:cart_id]
		@cart = session[:cart_id] ? Cart.find(cart_id) :Cart.create
		session[:cart_id] = @cart.id
	end
end