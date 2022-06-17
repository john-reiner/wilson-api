if @user
    json.status :ok
    json.projects @projects.each do |project|
        json.id project.id
        json.title project.title
        json.description project.description
        json.github_url project.github_url
        json.public project.public
    end
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end