class VariantItemsController < ApplicationController
	def create
		@variant_item = @variant.variantitems.create(var_item_params)
	end

	private
	def var_item_params
		params.require(:variant_item).permit(:name)
	end
end
