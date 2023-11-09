class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	
	before_action :extract_shopping_cart
	
	private
	def extract_shopping_cart
		cart_id = session[:cart_id]
		@cart = session[:cart_id] ? Cart.find(cart_id) :Cart.create
		session[:cart_id] = @cart.id
	end
end
