class AuthenticationController < ApplicationController

    def login

        user = User.find_by(username: params[:username])
    
        if user && user.authenticate(params[:password])
            secret_key = Rails.application.secrets.secret_key_base
            token = JWT.encode({
                user_id: user.id,
                username: user.username,
            }, secret_key)
            render json: { message: "Thank you for logging in #{user.username}", data: user, token: token }
        else
            render json: { message: "Unable to verifiy username or password. Please try again."}
        end

    end
end
