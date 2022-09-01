class Api::V2::FeaturesController < ApplicationController

  before_action :set_feature, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:index, :create]

  # GET /features
  def index
    @features = Project.find(params[:project_id]).features
    @priority_counts = {
      high: @features.where(priority: "high").count,
      medium: @features.where(priority: "medium").count,
      low: @features.where(priority: "low").count,
    }
    @stauts_counts = {
      created: @features.where(status: "created").count,
      paused: @features.where(status: "paused").count,
      working: @features.where(status: "working").count,
      ready: @features.where(status: "ready").count,
      completed: @features.where(status: "completed").count,
    }
  end

  # GET /features/1
  def show
    render status: :ok
  end

  # POST /features
  def create

    @feature = Feature.new(feature_params)
    @feature.project_id = params[:project_id]
    @feature.user_id = @user.id
    if @feature.save
      render status: :created
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /features/1
  def update
    if @feature.update(feature_params)
      render status: :ok
    else
      render json: @feature.errors, status: :unprocessable_entity
    end
  end

  # DELETE /features/1
  def destroy
    @feature.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @feature = Feature.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feature_params
      params.require(:feature).permit(:title, :description, :due_date, :public, :project_id, :status, :priority)
    end
end
