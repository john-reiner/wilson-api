class UsersController < ApplicationController
    def create
        user = User.create!(
            username: params[:username],
            password_digest: params[:password],
        )
        render json: {message: "Welcome #{user.username}"}
    end
end
