json.id @project.id
json.title @project.title
json.description @project.description
json.github_url @project.github_url
json.public @project.public
json.image @project.image
json.features do 
    json.low @low.each do |feature|
        json.id feature.id
        json.title feature.title
        json.description feature.description
        json.due_date feature.due_date
        json.status feature.status
    end
    json.medium @medium.each do |feature|
        json.id feature.id
        json.title feature.title
        json.description feature.description
        json.due_date feature.due_date
        json.status feature.status
    end   
    json.high @high.each do |feature|
        json.id feature.id
        json.title feature.title
        json.description feature.description
        json.due_date feature.due_date
        json.status feature.status
    end   
end

json.notes @project.notes do |note|
    json.id note.id
    json.content note.content
    json.created note.created_at
end
json.lists @project.lists do |list|
    json.id list.id
    json.title list.title
    json.tasks list.tasks do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end