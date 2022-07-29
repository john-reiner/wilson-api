class Api::V2::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy, :create_todo_default_list]
  before_action :authenticate_user, only: [:index, :create, :images]

  # GET /projects
  def index
    @projects = @user.projects
  end

  # GET /projects/1
  def show
    render status: :ok
    # @all_features = @project.features
    # @low = @project.features.where(priority: :low)
    # @medium = @project.features.where(priority: :medium)
    # @high = @project.features.where(priority: :high)
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

      render status: :created

    else
      render json: {errors: @project.errors, status: :unprocessable_entity}
    end
  end

  def images
    search = params[:search]
    pics = Unsplash::Photo.search(search)
    returned_pics = []
    pics.each do |pic|
      pic_hash = {
        alt: pic.alt_description,
        small_path: pic.urls.small,
        thumb_path: pic.urls.thumb,
        photographer_username: pic.user.username,
        photographer_user_path: pic.user.links.html        
      }
      returned_pics.push(pic_hash)
    end
    render json: {pics: returned_pics}
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      render status: :ok
      # @all_features = @project.features
      # @low = @project.features.where(priority: :low)
      # @medium = @project.features.where(priority: :medium)
      # @high = @project.features.where(priority: :high)
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    render status: :ok
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
