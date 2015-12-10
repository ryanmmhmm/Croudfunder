class ProjectsController < ApplicationController

skip_before_action :require_login, only: [:index, :show, :login], notice: 'Please login to perform this action'

	def index
		@projects = Project.all.order(start_date: :asc)
		@categories = ['Art','Comics', 'Crafts', 'Dance', 'Design', 'Fashion', 'Film & Video', 'Food', 'Games', 'Journalism', 'Music', 'Photography', 'Publishing', 'Technology', 'Theatre']

		@projects = if params[:title]
			Project.where("LOWER(title) LIKE LOWER (?)", "%#{params[:title]}%")
		else
			Project.all.order(start_date: :asc)
		end
	end

	def show
		@project = Project.find(params[:id])
		@rewards = @project.rewards
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)
		@project.owner_id = session[:user_id]

		flash.now[:alert] = 'Something went wrong.' if Project.create.errors.any?

		if @project.save
			redirect_to :root, notice: "Thank you for creating the new project #{@project.title}, happy funding!"
		else
			render :new
		end
	end

	def update
		@project = Project.find(params[:id])

		if @project.update_attributes(project_params)
			redirect_to projects_path(@project)
		else
			render :edit
		end
	end

	def destroy
		@project = Project.find(params[:id])
		@project.destroy
		redirect_to projects_path

	end

	private
	def project_params
		params.require(:project).permit(
			:title,
			:start_date,
			:end_date,
			:funding_goal,
			:category,
			:description,
			:picture_url,
			:owner_id,
			rewards_attributes: [:amount, :description, :quantity, :_destroy])
	end

  def not_authenticated
    redirect_to :login, alert: 'Please login first.'
  end
end
