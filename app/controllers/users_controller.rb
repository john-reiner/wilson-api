class UsersController < ApplicationController
    def create
        user = User.create!(
            username: params[:username],
            password: params[:password],
        )
        render json: {message: "Welcome #{user.username}", data: user}
    end
end
