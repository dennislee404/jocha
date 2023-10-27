class CartsController < ApplicationController
	def show
	end

	def destroy
		@cart.clear
		redirect_to root_path
	end
end