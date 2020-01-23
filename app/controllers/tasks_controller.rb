class TasksController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
    set_message
  end

  def new
    @task = Task.new
  end
  
  def create
    @task= Task.new(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end  

  def edit
    set_message
  end

  def update
    set_message

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task は更新されませんでした'
      render :edit
    end
  end
  def destroy
    set_message
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private

  # Strong Parameter
   def set_message
    @task=Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end
end
