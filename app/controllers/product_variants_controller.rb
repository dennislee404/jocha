class ProductVariantsController < ApplicationController
	def create
		@product = Product.find(:id)
		@product_variant = @product.product_variants.create(prodvar_params)
		
		redirect_to product_path(@product)
	end

	private
	def prodvar_params
		params.require(:product_variant).permit(:variant_id,:price)
	end
end