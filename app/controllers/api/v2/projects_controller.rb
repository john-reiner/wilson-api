class Api::V2::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :create_todo_default_list]
  before_action :authenticate_user, only: [:index, :create, :images]

  # GET /projects
  def index
    @projects = @user.projects
  end

  # GET /projects/1
  def show
    @all_features = @project.features
    @low = @project.features.where(priority: :low)
    @medium = @project.features.where(priority: :medium)
    @high = @project.features.where(priority: :high)
  end

  # POST /projects
  def create
    
    @project = Project.new(project_params)
    @project.user = @user
    
    if @project.save
      @project.lists.create(
        title: "Project - #{@project.title}: To Do's",
        user: @user
      )
      render json: {status: :ok, project: @project}
    else
      render json: {errors: @project.errors, status: :unprocessable_entity}
    end
  end

  def images
    search = params[:search]
    pics = Unsplash::Photo.search(search)
    returned_pics = []
    # byebug
    pics.each do |pic|
      path = pic.urls.small
      returned_pics.push(path)
    end
    render json: {pics: returned_pics}
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
      params.require(:project).permit(:title, :description, :github_url, :public, :image)
    end
end
