class GoalsController < ApplicationController

    before_action :authenticate_user

    def index
        goals = Goal.where(user_id: @user.id)
        goals.order(:due_date)
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

        # if goal.update_attributes(goal_params)
        #     render json: {status: 'SUCCESS', message: 'goal Updated', data:goal}, status: :ok
        # else 
        #     render json: {status: 'ERROR', message: 'goal NOT Updated', data:goal.errors}, status: :unprocessable_entity
        # end

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