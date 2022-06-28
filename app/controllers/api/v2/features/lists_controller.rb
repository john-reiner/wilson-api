class Api::V2::Features::ListsController < Api::V2::ListsController
    before_action :set_listable

    private

    def set_listable
        @listable = Feature.find(params[:feature_id])
    end
end