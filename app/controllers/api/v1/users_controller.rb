module Api
    module V1
        
        class UsersController < ApplicationController
        
            before_action :authenticate_user, only: [:show, :user]
        
            def create
                user = User.create(user_params)
                if user.errors.any?
                    render json: {errors: user.errors}
                else
                    render json: user
                end
            end
        
            def user
                if @user 
                    render json: @user
                else 
                    render status: :unauthorized
                end
            end 
        
            def show
                # user = User.find(@user.id)
                render json: @user
                # user = User.find(params[:id])
                # if user && user.id == @user.id
                #     render json: {username: user.username}
                # else 
                #     render status: :unauthorized
                # end 
            end
        
            private

            def user_params
                params.require(:user).permit(:username, :password, :password_confirmation)
            end
        end
    end    
end

