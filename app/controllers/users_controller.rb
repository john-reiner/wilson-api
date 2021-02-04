class UsersController < ApplicationController

    def create
        user = User.create!(
            username: params[:username],
            password: params[:password],
        )
        
        render json: {message: "Welcome #{user.username}", data: user}, status: :created
    end

    def show
        user = User.find(params[:id])
        if user && user.id == @user.id
            render json: user
        else 
            render status: :unauthorized
        end 
    end

end
