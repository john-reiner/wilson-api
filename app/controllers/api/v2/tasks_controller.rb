class Api::V2::TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]
  before_action :set_list, only: [:index, :create]
  before_action :authenticate_user, only: [:index, :create]


  # GET /tasks
  def index
    @tasks = @list.tasks
  end

  # GET /tasks/1
  def show
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.user = @user
    @task.completed = false
    @task.list = @list
    set_status
    # byebug
    if @task.save
      render status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  def update

      if @task.update(task_params)
        @list = @task.list
        set_status
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
      @list = List.find(params[:list_id])
  end

      # Only allow a trusted parameter "white list" through.
      def task_params
          params.require(:task).permit(:content, :completed, :list_id, :description)
      end
end
