if @user
    json.status :ok
    json.user do
        json.id @user.id
        json.username @user.username
        json.first_name @user.first_name
        json.last_name @user.last_name
        json.email @user.email
        json.projects @user.projects.each do |project|
            json.id project.id
            json.title project.title
            json.description project.description
            json.github project.github_url
            json.public project.public
            json.lists project.lists.each do |list|
                json.id list.id
                json.title list.title
                json.tasks list.tasks.each do |task|
                    json.id task.id
                    json.content task.content
                    json.completed task.completed
                end
            end
        end
    end
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end