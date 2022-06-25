if @user
    json.status :ok
    json.projects @projects.each do |project|
        json.id project.id
        json.title project.title
        json.description project.description
        json.github_url project.github_url
        json.public project.public
        json.author_first project.user.first_name
        json.author_last project.user.last_name
        json.created project.created_at
        json.modified project.updated_at
    end
    json.projects_total @projects.count
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end