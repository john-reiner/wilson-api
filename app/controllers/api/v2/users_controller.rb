class Api::V2::UsersController < ApplicationController
    before_action :find_user
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

    end

    def user

        # if @user 
        #     render json: @user
        # else 
        #     render status: :unauthorized
        # end
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

    def find_user

        @user = User.find_by(id: params[:id])
    end
end


