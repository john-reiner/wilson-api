class TasksController < ApplicationController

    before_action :authenticate_user

    def create
        task = Task.create(
            name: params[:name],
            goal_id: params[:goal_id]
        )
        if task.errors.any?
            render json: {errors: task.errors}
        else
            render json: task
        end
    end

    def complete_task
        task = Task.find(params[:id])
        task.update(completed: !task.completed)
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

    def destroy
        task = Task.find(params[:id])
        task.destroy
        render json: task
    end

    private

    def task_params
        params.require(:task).permit(:goal_id, :name, :completed)
    end
    
end
