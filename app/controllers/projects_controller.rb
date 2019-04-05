class ProjectsController < ApplicationController

	before_action :set_project, only: [:show, :edit, :update]

	def index
		if current_user.admin?
			@projects = Project.all
		else
			@projects = current_user.projects
		end
	end

	def new
		@project = Project.new
	end

	def create
    @project = Project.new(project_params)
      respond_to do |format|
        if @project.save
          format.html do
            redirect_to projects_path, notice: 'Project was successfully created.'
          end
        else
          format.html { render :new }
        end
    end
	end

  def edit
  end

  def update
    respond_to do |format|
     if @project.update(project_params)
       format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
     else
       format.html { render :edit }
     end
    end
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :client_name, :technology_stack, :project_type)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
