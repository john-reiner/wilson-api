module AuthenticateUserConcern
    extend ActiveSupport::Concern

    def authenticate_user

        authorization_header = request.headers[:authorization]
        # byebug
        if authorization_header
            token = authorization_header.split(" ")[1]
            secret_key = Rails.application.secrets.secret_key_base
            
            decoded_token = JWT.decode(token, secret_key)[0]

            @user = User.find(decoded_token["user_id"])
        else
            render status: :unauthorized
        end
    end

end