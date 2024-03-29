class Api::V2::NotesController < ApplicationController
    before_action :set_note, only: [:show, :update, :destroy]
    before_action :authenticate_user, only: [:index, :create]

    def index
        @notes = @notable.notes
    end

    def show

    end

    # POST /notes
    def create
        @note = @notable.notes.new note_params
        @note.user = @user
        if @note.save
            render status: :created
        else
            render json: {errors: @note.errors, status: :unprocessable_entity}
        end
    end

    # PATCH/PUT /notes/1
    def update
    
        if @note.update(note_params)
            render status: :ok
        else
            render json: @note.errors, status: :unprocessable_entity
        end
    end

    # DELETE /notes/1
    def destroy
        @note.destroy
        render status: :ok
    end


    private
    # Use callbacks to share common setup or constraints between actions.

    def set_note
        @note = Note.find(params[:id])
    end

    def set_user
        @user = User.find(params[:user_id])
    end

    # Only allow a trusted parameter "white list" through.
    def note_params
        params.require(:note).permit(:content, :title)
    end
end
