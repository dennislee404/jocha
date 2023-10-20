class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name)
		end
end