class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	
	def new
		@category = Category.find_by(id: params[:category_id])
		@product = Product.new
		@product_variant = ProductVariant.new
	end

	def create
		@category = Category.find_by(name: params[:product][:category])
		@product = @category.products.create(product_params)

		if @product.save
			redirect_to category_path(@category)
		else
			render :new 
		end
	end

	def show
		@product = Product.find(params[:id])
	end 

	def edit
		@category = @product.category
	end

	def update
		@category = @product.category
		if @product.update(product_params)
			redirect_to category_path(@category)
		else
			render :edit 
		end
	end

	def destroy
		@category = Category.find_by(id: @product.category_id)
		@product.destroy
		

		redirect_to category_path(@category)
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name,:price,:photo,product_variant_attributes: [:variant_item_id,:price])
		end
end