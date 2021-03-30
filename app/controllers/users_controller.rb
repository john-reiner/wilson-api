class UsersController < ApplicationController

    before_action :authenticate_user, only: [:show, :user]

    def create
        user = User.create(
            username: params[:username],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
        )
        # render json: {message: "Welcome #{user.username}", data: user}, status: :created

        if user.errors.any?
            render json: {errors: user.errors}
        else
            render json: user
        end 
        # if user.errors 
        #     render json: {status: 'SUCCESS', message: 'User Created', data:user},status: :ok
        # else
        #     render json: {status: 'ERROR', message: 'User NOT Created', data:user.errors},status: :unprocessable_entity
        # end

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
