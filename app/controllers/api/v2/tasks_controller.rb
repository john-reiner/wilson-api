class Api::V2::TasksController < ApplicationController
before_action :set_task, only: [:show, :update, :destroy]
before_action :authenticate_user, only: [:index, :create]

# GET /tasks
def index
  # byebug
  @tasks = @list.tasks

  render json: {tasks: @tasks, status: :ok}
end

# GET /tasks/1
def show
  render json: {task: @task, status: :ok}
end

# POST /tasks
def create
  @task = Task.new(task_params)
  @task.user = @user
  @task.completed = false
  if @task.save
    render json: {task: @task, status: :created}
  else
    render json: @task.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /tasks/1
def update
  # byebug
    if @task.update(task_params)
        render json: {task: @task, status: :ok}
    else
        render json: @task.errors, status: :unprocessable_entity
    end
end

# DELETE /tasks/1
def destroy
    @task.destroy
    render json: {status: :ok}
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
        @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
        params.require(:task).permit(:content, :completed, :list_id, :description)
    end
end
