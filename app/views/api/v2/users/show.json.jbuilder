if @user
    json.status :ok
    json.message do
        json.id @user.id
        json.first_name @user.first_name
        json.last_name @user.last_name
        json.email @user.email
    end
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end