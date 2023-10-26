class CategoriesController < ApplicationController
	before_action :set_category, only: [:show, :edit, :update, :destroy]
	def new
		@category = Category.new
	end

	def create
		@category = Category.create(category_params)

		if @category.save
			redirect_to menu_path_url
		else
			render :new
		end
	end

	def show
		@categories = Category.all.order(created_at: :asc)
		@category = Category.find(params[:id])

	end

	def edit
	end

	def update
		if @category.update(category_params)
			redirect_to menu_path_url
		else
			render :edit 
		end
	end

	def destroy
		@category.destroy

		redirect_to menu_path_url
	end

	private
		def set_category
			@category = Category.find(params[:id])
		end

		def category_params
			params.require(:category).permit(:name)
		end
end