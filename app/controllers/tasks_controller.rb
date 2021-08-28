class TasksController < ApplicationController
before_action :get_category

  def index
    @tasks = @category.tasks
  end

  def new
    @task = @category.tasks.build
  end

  def create
    @task = @category.tasks.build(task_params)
    if @task.save
      redirect_to category_tasks_path
    else
      render :new
    end
  end


  def destroy
      
    @task = Task.find(params[:id])
      @task.destroy
      redirect_to category_tasks_path
  end


  private


  def get_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:body, :category_id)
  end

end
