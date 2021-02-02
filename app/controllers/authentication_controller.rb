class AuthenticationController < ApplicationController

    def login

        user = User.find_by(username: params[:username])
    
        if user && user.authenticate(params[:password])
            render json: { message: "Thank you for logging in #{user.username}", data: user }
        else
            render json: { message: "Unable to verifiy username or password. Please try again."}
        end

    end
end
