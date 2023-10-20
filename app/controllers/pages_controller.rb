class PagesController < ApplicationController
	def index
	end

	def menu
		@categories = Category.all.order(:created_at)
	end
end