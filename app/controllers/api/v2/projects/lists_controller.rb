class Api::V2::Projects::ListsController < Api::V2::ListsController
    before_action :set_listable

    private

    def set_listable
        @listable = Project.find(params[:project_id])
    end
end