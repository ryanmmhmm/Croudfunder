class RewardsController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
  before_action :load_project

  def index
    @rewards = Reward.all
  end

	def show
    @project = Project.find(params[:project_id])
    @reward = Reward.find(params[:id])
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
  end

  def edit
    @reward = Reward.find(params[:id])
  end


  def update
    @reward = Reward.find(params[:id])

    if @reward.update_attributes(reward_params)
      redirect_to rewards_path(@reward)
    else
      render :edit, alert: 'Something went wrong, please try again'
    end
  end

  def destroy
    @reward = Reward.find(params[:id])
    @reward.destroy
    redirect_to rewards_path
  end

  private
  def reward_params
    params.require(:rewards).permit(:title, :desciption, :amount, :quantity, :project_id)
  end

  def load_project
    @project = Project.find(params[:project_id])
  end
end

