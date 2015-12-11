class PledgesController < ApplicationController

  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@pledge = Pledge.new(pledge_params)
  	@pledge.user = current_user
  	if @pledge.save
  		redirect_to current_user
  	else
  		render "projects/show", notice: "Pledge couldn't be processed"
  	end
  end

  def new
  	@pledge = Pledge.new
  end

  def destroy
  	@pledge = Pledge.find(params[:id])
  	@pledge.destroy
  end

  private
  def pledge_params
  	params.require(:pledge).permit(:reward_id)
  end
end
