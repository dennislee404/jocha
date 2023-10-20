class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	def new
		@category = Category.find(params[:category_id])
		@product = Product.new
	end

	def create
		@category = Category.find(params[:category_id])
		@product = @category.products.create(product_params)

		if @product.save
			redirect_to category_path(@category)
		else
			render :new 
		end
	end

	def edit
		@category = Category.find(params[:category_id])
	end

	def update
		@category = Category.find(params[:category_id])
		if @product.update(product_params)
			redirect_to category_path(@category)
		else
			render :edit 
		end
	end

	def destroy
		@category = Category.find(params[:category_id])
		@product.destroy

		redirect_to category_path(@category)
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name,:price)
		end
end