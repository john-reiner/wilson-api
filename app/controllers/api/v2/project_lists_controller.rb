class Api::V2::ProjectListsController < ApplicationController
  before_action :set_project_list, only: [:show, :update, :destroy]

  # GET /project_lists
  def index
    @project_lists = ProjectList.all

    render json: @project_lists
  end

  # GET /project_lists/1
  def show
    render json: @project_list
  end

  # POST /project_lists
  def create
    @project_list = ProjectList.new(project_list_params)

    if @project_list.save
      render json: @project_list, status: :created, location: @project_list
    else
      render json: @project_list.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /project_lists/1
  def update
    if @project_list.update(project_list_params)
      render json: @project_list
    else
      render json: @project_list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_lists/1
  def destroy
    @project_list.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_list
      @project_list = ProjectList.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_list_params
      params.require(:project_list).permit(:title, :project_id)
    end
end
