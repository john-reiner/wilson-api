class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show, :user]

    def create
        user = User.create!(
            username: params[:username],
            password: params[:password],
        )
        
        render json: {message: "Welcome #{user.username}", data: user}, status: :created
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

end
