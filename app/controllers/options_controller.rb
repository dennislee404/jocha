class OptionsController < ApplicationController
	before_action :set_option, only: [:show, :edit, :update, :destroy]
	def index
		@options = Option.all
	end	

	def new
		@option = Option.new
		@option_item = OptionItem.new
	end

	def create
		@option = Option.create(variant_params)

		if @option.save
			redirect_to options_path
		else
			render :new
		end
	end

	def show
		@option = Option.find(params[:id])
	end

	def edit
	end

	def update
		if @option.update(option_params)
			redirect_to options_path
		else
			render :edit 
		end
	end

	def destroy
		@option.destroy

		redirect_to options_path
	end

	private
		def set_category
			@option = Option.find(params[:id])
		end

		def variant_params
			params.require(:option).permit(:name)
		end
end