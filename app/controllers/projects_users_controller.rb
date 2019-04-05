class ProjectsUsersController < ApplicationController

  def index
    @project = Project.find(params[:project_id])
  end

  def create
    @projects_user = ProjectsUser.new(projects_users_params)
    @projects_user.save!
    redirect_to projects_users_path(project_id: projects_users_params[:project_id])
  end

  private
  def projects_users_params
    params.require(:projects_user).permit(:project_id, :user_id)
  end
end
