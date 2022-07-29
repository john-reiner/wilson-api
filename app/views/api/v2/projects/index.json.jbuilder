if @user
    json.status :ok
    json.projects @projects.each do |project|
        json.partial! 'project', project: project
    end
    json.projects_total @projects.count
else
    json.status :unauthorized
    json.message "Unable to authenticate user credentials please login"
end