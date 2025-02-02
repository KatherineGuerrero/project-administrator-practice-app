class TasksController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy
    redirect_to @project
  end

  private

  def task_params
    params.require(:task).permit(:title, :status, :deadline)
  end
end
