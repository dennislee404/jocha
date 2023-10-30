class VariantsController < ApplicationController
	before_action :set_variant, only: [:show, :edit, :update, :destroy]
	def index
		@variants = []
		Variant.all.each do |variant|
			if @variants.include? variant
			else 
				@variants << variant
			end
		end 
		@selections = []
		binding.break
	end	

	def new
		@variant = Variant.new
	end

	def create
		@variant = Variant.create(variant_params)

		if @variant.save
			redirect_to variants_path
		else
			render :new
		end
	end

	def show
		@variant = Variant.find(params[:id])
	end

	def edit
	end

	def update
		if @variant.update(variant_params)
			redirect_to variants_path
		else
			render :edit 
		end
	end

	def destroy
		@variant.destroy

		redirect_to variants_path
	end

	private
		def set_category
			@variant = Variant.find(params[:id])
		end

		def variant_params
			params.require(:variant).permit(:name, :selection)
		end
end
