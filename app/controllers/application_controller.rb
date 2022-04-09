class ApplicationController < ActionController::API
    include AuthenticateUserConcern
    include LoginUserConcern
end
