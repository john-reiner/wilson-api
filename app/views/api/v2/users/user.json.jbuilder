if @user
    json.status :ok
    json.user do
        json.id @user.id
        json.username @user.username
        json.first_name @user.first_name
        json.last_name @user.last_name
        json.email @user.email
        json.projectsTotal @user.projects.count
    end
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end