module LoginUserConcern
    extend ActiveSupport::Concern

    def login_user

        user = User.find_by(email: params[:user][:email])

        if user && user.authenticate(params[:user][:password])
            secret_key = Rails.application.secret_key_base
            token = JWT.encode({
                user_id: user.id,
                username: user.username,
            }, secret_key)
            render json: {status: :ok, token: token}
        else
            render json: {status: :unauthorized, message: "Unable to verifiy username or password. Please try again."}
        end
    end

end