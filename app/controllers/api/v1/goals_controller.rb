module Api
    module V1
        class GoalsController < ApplicationController
        
            before_action :authenticate_user
        
            def index
                goals = Goal.order(:due_date)
                user_goals = goals.where(user_id: @user.id)
                render json: user_goals, :include => :tasks
            end
        
            def show
                goal = Goal.find_by(id: params[:id])
        
                if goal && goal.user_id == @user.id
                    render json: goal, :include => :tasks
                else 
                    render status: :unauthorized
                end 
            end
        
            def complete_goal
                goal = Goal.find(params[:id])
                goal.update(completed: true, completed_date: Date.current.to_s)
                render json: goal
            end
        
            def create
                goal = Goal.create(
                    name: params[:name],
                    user_id: @user.id,
                    description: params[:description],
                    rgb: params[:rgb],
                    due_date: params[:due_date]
                )
                if goal.errors.any?
                    render json: {errors: goal.errors}
                else
                    render json: goal
                end
            end
        
            def update
                goal = Goal.find(params[:id])
                goal.update_attributes(goal_params)
        
                if goal.errors.any?
                    render json: {errors: goal.errors}
                else
                    render json: goal
                end
        
            end
        
            def destroy
                goal = Goal.find(params[:id])
                goal.destroy
                render json: goal
            end
        
            private
        
            def goal_params
                params.require(:goal).permit(:user_id, :name, :completed, :description, :rgb, :due_date)
            end
        end
    end
end