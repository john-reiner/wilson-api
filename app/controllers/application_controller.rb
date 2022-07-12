class ApplicationController < ActionController::API
    include AuthenticateUserConcern
    include LoginUserConcern
    include SetStatusConcern
end
