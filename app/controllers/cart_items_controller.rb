class CartItemsController < ApplicationController
	def create
		@item = Product.find(params[:id])
		@cart.add(@item, @item.price)
		redirect_to cart_path
	end

	def update
		@item = CartItem.find(params[:id])

		@item.update(quantity: params[:quantity])
		redirect_back fallback_location: root_path
	end

	def destroy
		CartItem.destroy(params[:id])
		redirect_back fallback_location: root_path
	end
end
