module AuthenticateUserConcern
    extend ActiveSupport::Concern

    def authenticate_user

        authorization_header = request.headers[:authorization]
        # byebug
        if authorization_header
            token = authorization_header.split(" ")[1]
            secret_key = Rails.application.secret_key_base
            begin
                decoded_token = JWT.decode(token, secret_key)[0]
            rescue => exception
                render json: {status: :unauthorized, error: "JWT", message: exception}
            else
                @user = User.find(decoded_token["user_id"])
            end
        else
            render status: :unauthorized
        end
    end

end