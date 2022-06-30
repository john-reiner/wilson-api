class Api::V2::TasksController < ApplicationController
before_action :set_task, only: [:show, :update, :destroy]
before_action :set_list, only: [:create, :index]
before_action :authenticate_user, only: [:index, :create]

# GET /tasks
def index
  # byebug
  @tasks = @list.tasks

  render json: {tasks: @tasks, status: :ok}
end

# GET /tasks/1
def show
  render json: @task
end

# POST /tasks
def create
  @task = Task.new(task_params)
  @task.user = @user
  @task.list = @list
  @task.completed = false
  if @task.save
    render json: {message: @task, status: :created}
  else
    render json: @task.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /tasks/1
def update
    if @task.update(task_params)
        render json: @task
    else
        render json: @task.errors, status: :unprocessable_entity
    end
end

# DELETE /tasks/1
def destroy
    @task.destroy
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
        @task = Task.find(params[:id])
    end

    def set_list
      # byebug
      @list = List.find(params[:list_id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
        params.require(:task).permit(:content, :completed, :list_id)
    end
end
