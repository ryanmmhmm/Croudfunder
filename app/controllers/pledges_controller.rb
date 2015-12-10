class PledgesController < ApplicationController
  before_action :load_reward

  def show
  	@pledge = Pledge.find(params[:id])
  end

  def create
  	@pledge = @reward.Pledge.new
  	@pledge.owner = current_user
  end

  def new
  	@pledge = Pledge.new
  end

  def destroy
  	@pledge = Pledge.find(params[:id])
  	@pledge.destroy
  end

  private
  def load_reward
  	@reward = Reward.find(params[:reward_id])
  end

  def pledge_params
  	params.require(:pledge).permit(:reward_id, :user_id)
  end
end
