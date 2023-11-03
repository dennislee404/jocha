class OrdersController < ApplicationController
	def new
		@order = Order.new
	end

	def create
		@order = Order.create(status: 1)

		if @order.save
			@cart.cart_items.each do |cart_item|
				@order.order_items.create(product_id: cart_item.item.id, quantity: cart_item.quantity, price: cart_item.price_cents)
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