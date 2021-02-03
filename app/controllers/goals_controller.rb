class GoalsController < ApplicationController
    def index
        goals = Goal.all 
        render json: goals
    end

    def create
        goal = Goal.create(
            name: params[:name]
        )
        render json: goal
    end
end
