class TasksController < ApplicationController

    before_action :authenticate_user

    def create
        task = Task.create!(
            name: params[:name],
            goal_id: params[:goal_id]
        )
        render json: task
    end
    
end
