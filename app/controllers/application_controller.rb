class ApplicationController < ActionController::API
    include AuthenticateUserConcern
    include LoginUserConcern
    include SetStatusConcern
    include FormatDateConcern
end
