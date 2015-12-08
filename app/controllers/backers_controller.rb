class BackersController < ApplicationController

	def index
		@backers = Backer.all
	end

	def show
		@backer = Backer.find(params[:id])
	end

	def destroy
	end

	def edit
		@product = Backer.find(params[:id])
	end

	def update
		@backer = Backer.find(params[:id])
		if @backer.update_attributes(backer_params)
			redirect_to backers_path
		else
			render :edit
		end
	end

	def create
		@backer = Backer.new(backer_params)
		if @backer.save
			redirect_to backers_url
		else
			render :new
		end
	end

	def new
		@backer = Backer.new
	end


end
