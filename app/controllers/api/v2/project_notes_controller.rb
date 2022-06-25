class Api::V2::ProjectNotesController < ApplicationController
  before_action :set_project_note, only: [:show, :update, :destroy]

  # GET /project_notes
  def index
    @project_notes = ProjectNote.all

    render json: @project_notes
  end

  # GET /project_notes/1
  def show
    render json: @project_note
  end

  # POST /project_notes
  def create
    @project_note = ProjectNote.new(project_note_params)
    @project_note.project_id = params[:project_id]
    if @project_note.save
      render json: {message: @project_note, status: :created}
    else
      render json: @project_note.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /project_notes/1
  def update
    if @project_note.update(project_note_params)
      render json: {message: @project_note, status: :ok}
    else
      render json: @project_note.errors, status: :unprocessable_entity
    end
  end

  # DELETE /project_notes/1
  def destroy
    @project_note.destroy
    render json: {message: @project_note, status: :ok}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_note
      @project_note = ProjectNote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_note_params
      params.require(:project_note).permit(:title, :content, :project_id)
    end
end
