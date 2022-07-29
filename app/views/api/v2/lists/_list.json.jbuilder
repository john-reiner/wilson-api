json.id list.id
json.title list.title
json.status list.status
json.tasks list.tasks.each do |task|
    json.id task.id
    json.content task.content
    json.completed task.completed
end