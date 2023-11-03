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
			# get cart_item
			@cart_item = @cart.cart_items.where(item_id: @item.id).last
			
			# set item based on product/product_variant
			if @cart_item.item_type == "Product"
				@item = @cart_item.item
			else
				@item = @cart_item.item.product
			end

			# check item option
			option_id = []	
			if @item.product_options.any?
				@item.product_options.each do |opt|
					option_id << opt.option_id
				end
			end

			# create cart_item_options
			i = 0
			while i < option_id.length
				if params["option_#{option_id[i]}"].is_a? Array
					params["option_#{option_id[i]}"].each do |opt|
						@cart_item_option = CartItemOption.create(cart_item_id: @cart_item.id, option_item_id: opt.to_i)
					end	
				else
					@cart_item_option = CartItemOption.create(cart_item_id: @cart_item.id, option_item_id: params["option_#{option_id[i]}"].to_i)	
				end
				i += 1
			end

			#get cart_item_option prices
			@cart_item_price = @cart_item.price_cents
			@cart_item.cart_item_options.each do |opt|
				@cart_item_price += opt.option_item.price*100
			end

			#update cart_item price
			@cart_item.update(price: @cart_item_price/100)
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

