class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)
    if @task
      redirect_to @task
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      redirect_to task_url(task)
    else
      redirect_to edit_task_url(task)
    end
  end

  def destroy
    if Task.destroy params[:id]
      redirect_to tasks_url
    else
      redirect_to task_url(params[:id])
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :status, :creator, :performer, :completed)
  end
end
