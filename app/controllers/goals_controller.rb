class GoalsController < ApplicationController

    before_action :authenticate_user

    def index
        goals = Goal.where(user_id: @user.id)
        render json: goals, :include => :tasks
    end

    def show

        goal = Goal.find_by(id: params[:id])

        if goal && goal.user_id == @user.id
            render json: goal, :include => :tasks
        else 
            render status: :unauthorized
        end 

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