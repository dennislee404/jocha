class OrdersController < ApplicationController
	def index
		@orders = Order.all.order(created_at: :desc)
	end

	def new
		@order = Order.new
	end

	def create
		if user_signed_in?
			@order = current_user.orders.create(status: 1)
		else
			@order = Order.create(status: 1)
		end
		
		if @order.save
			@cart.cart_items.each do |cart_item|
				if cart_item.item_type == "Product"
					@order_item = @order.order_items.create(product: "#{cart_item.item.name} (#{sprintf "%.2f",cart_item.item.price}/ea)", quantity: cart_item.quantity, price: cart_item.price_cents)
				else
					@order_item = @order.order_items.create(product: "#{cart_item.item.product.name} (#{cart_item.item.variant_item.name}) (#{sprintf "%.2f",cart_item.item.price}/ea)", quantity: cart_item.quantity, price: cart_item.price_cents)
				end

				cart_item.cart_item_options.each do |cart_item_option|
					@order_item.order_item_options.create(name: cart_item_option.option_item.name, price: cart_item_option.option_item.price)
				end
			end
			redirect_to order_path(@order)
		else
			render :new
		end
	end

	def show
		@order = Order.find(params[:id])
	end
end