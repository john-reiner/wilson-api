class Api::V2::Features::NotesController < Api::V2::NotesController
    before_action :set_notable

    private

    def set_notable
        @notable = Feature.find(params[:feature_id])
    end
end