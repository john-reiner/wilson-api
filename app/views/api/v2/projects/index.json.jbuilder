if @user

    json.status :ok
    json.projects @projects.each do |project|
        json.id project.id
        json.title project.title
    end
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end