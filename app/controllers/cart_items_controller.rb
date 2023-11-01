class CartItemsController < ApplicationController
	def create
		@item = Product.find(params[:id])
		if @item.product_variants.any?
			@item_variant = ProductVariant.find(params[:variant_item_id])
			@cart.add(@item_variant, @item_variant.price)
		else
			@cart.add(@item, @item.price)
		end

		if @cart.save
			redirect_back fallback_location: root_path
		else
			redirect_to	product_path(params[:id]), notice: "fail to process"
		end
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
