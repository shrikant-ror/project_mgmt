class TodosController < ApplicationController

  def index
    if current_user.admin?
      project = Project.find(params[:project_id])
      @todos = project.todos
    else
      @todos = Todo.where(user_id: current_user.id)
    end
  end

  def new
    project = Project.find(params[:project_id])
    @todo = project.todos.build
  end

  def create
    project = Project.find(params[:project_id])
    @todo = project.todos.create(todos_params)
    respond_to do |format|
      if @todo.save
        format.html { redirect_to([@todo.project, @todo], :notice => 'Todo was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
  end

  private
  def todos_params
    params.require(:todo).permit(:task, :description, :acceptance_criteria, :status, :priority, :user_id)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
