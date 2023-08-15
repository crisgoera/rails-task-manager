class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
    #<Task:... id: nil, title: nil, details: nil, completed: false, created_at: nil, updated_at: nil>
  end

  def create
    @task = Task.new(task_params)
    @task.save
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def delete
    @task = Task.find(params[:id])
    @task.delete
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
