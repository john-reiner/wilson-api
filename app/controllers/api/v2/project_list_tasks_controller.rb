class Api::V2::ProjectListTasksController < ApplicationController
  before_action :set_project_list_task, only: [:show, :update, :destroy]

  # GET /project_list_tasks
  def index
    @project_list_tasks = ProjectListTask.all

    render json: @project_list_tasks
  end

  # GET /project_list_tasks/1
  def show
    render json: @project_list_task
  end

  # POST /project_list_tasks
  def create
    @project_list_task = ProjectListTask.new(project_list_task_params)

    if @project_list_task.save
      render json: @project_list_task, status: :created, location: @project_list_task
    else
      render json: @project_list_task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_list_tasks/1
  def update
    if @project_list_task.update(project_list_task_params)
      render json: @project_list_task
    else
      render json: @project_list_task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_list_tasks/1
  def destroy
    @project_list_task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_list_task
      @project_list_task = ProjectListTask.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_list_task_params
      params.require(:project_list_task).permit(:content, :project_list_id)
    end
end
