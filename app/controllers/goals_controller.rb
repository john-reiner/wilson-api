class GoalsController < ApplicationController

    before_action :authenticate_user

    def index
        goals = Goal.where(user_id: @user.id)
        render json: goals
    end

    def create
        goal = Goal.create!(
            name: params[:name],
            user_id: @user.id,
            description: params[:description]
        )
        render json: goal
    end
end
