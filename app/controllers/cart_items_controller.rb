class CartItemsController < ApplicationController
	def create
		@item = Product.find(params[:id])
		if @item.product_variants.any?
			@item = ProductVariant.find(params[:variant_item_id])
			@cart.add(@item, @item.price)
		else
			@cart.add(@item, @item.price)
		end

		if @cart.save
			@cart_item = @cart.cart_items.where(item_id: @item.id)
			@ice_level = OptionItem.find(params[:option_1])
			@sugar_level = OptionItem.find(params[:option_2])
			@cart_item_option = CartItemOption.create(cart_item: @cart_item, option: @ice_level)
			@cart_item_option = CartItemOption.create(cart_item: @cart_item, option: @sugar_level)
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
