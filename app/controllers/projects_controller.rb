class ProjectsController < ApplicationController

skip_before_action :require_login, only: [:index, :show, :login], notice: 'Please login to perform this action'

	def index

		@categories = ['Art','Comics', 'Crafts', 'Dance', 'Design', 'Fashion', 'Film & Video', 'Food', 'Games', 'Journalism', 'Music', 'Photography', 'Publishing', 'Technology', 'Theatre']
	  params[:name] ||= @categories.sample

		if params[:name]
			@category_show = Project.order("created_at desc").find_by(category: params[:name])
		end
		# binding.pry
		if params[:title]
			@projects = Project.where("LOWER(title) LIKE LOWER (?)", "%#{params[:title]}%")
		else
			@projects = Project.all.order(start_date: :asc)
		end
			@random_projects = Project.random_project(3)

		respond_to do |format|

			format.html do
			if request.xhr?
				render(partial: "category", locals: {'@category_show': @category_show})
    	end
    end
      # format.js
    end
	end

	def show
		@project = Project.find(params[:id])
		@rewards = @project.rewards
		@project.days_left_message

		@pledge = Pledge.new
	end

	def new
		@project = Project.new
	end

	def edit
		@project = Project.find(params[:id])
	end

	def create
		@project = Project.new(project_params)
		@project.owner = current_user

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
			redirect_to project_path(@project)
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
