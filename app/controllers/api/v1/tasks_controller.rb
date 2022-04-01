module Api
    module V1
        
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
                task.update_attributes(task_params)
        
                if task.errors.any?
                    render json: {errors: task.errors}
                else
                    render json: task
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
    end    
end

