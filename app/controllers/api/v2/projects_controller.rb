class Api::V2::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :create_todo_default_list]
  before_action :authenticate_user, only: [:index, :create]

  # GET /projects
  def index
    @projects = @user.projects
  end

  # GET /projects/1
  def show
    # render json: {status: :ok, message: @project}
  end

  # POST /projects
  def create
    
    @project = Project.new(project_params)
    @project.user = @user
    
    if @project.save
      # byebug
      @project.lists.create(
        title: "Project - #{@project.title}: To Do's",
        user: @user
      )
      render json: {status: :ok, message: @project}
    else
      render json: {errors: @project.errors, status: :unprocessable_entity}
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    render json: {message: @project, status: :ok}
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def set_project
      @project = Project.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:title, :description, :github_url, :public)
    end
end
