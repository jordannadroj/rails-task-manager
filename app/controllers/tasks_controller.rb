class TasksController < ApplicationController
  def index
    @tasks = Task.all
    # raise
  end

  def new
    @task = Task.new # needed to instantiate the form_for
  end

  def show
    # raise
    @task = Task.find(params[:id])
    @completed = ''
    @task.completed ? @completed = 'complete' : @completed = ' not complete'
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
    # @task.save
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # raise
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end


