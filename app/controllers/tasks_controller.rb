class TasksController < ApplicationController

    before_action :authenticate_user

    def create
        task = Task.create!(
            name: params[:name],
            goal_id: params[:goal_id]
        )
        render json: task
    end

    def update
        task = Task.find(params[:id])

        if task.update_attributes(task_params)
            render json: {status: 'SUCCESS', message: 'Task Updated', data:task}, status: :ok
        else 
            render json: {status: 'ERROR', message: 'Task NOT Updated', data:task.errors}, status: :unprocessable_entity
        end 

    end

    private

    def task_params
        params.require(:task).permit(:goal_id, :name, :completed)
    end
    
end
