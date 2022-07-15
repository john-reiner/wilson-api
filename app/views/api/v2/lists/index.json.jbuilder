json.all @lists.each do |list|
    json.id list.id
    json.title list.title
    json.status list.status
    json.tasks list.tasks.each do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end
json.completed @completed.each do |list|
    json.id list.id
    json.title list.title
    json.status list.status
    json.tasks list.tasks.each do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end
json.ready @ready.each do |list|
    json.id list.id
    json.title list.title
    json.status list.status
    json.tasks list.tasks.each do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end
json.working @working.each do |list|
    json.id list.id
    json.title list.title
    json.status list.status
    json.tasks list.tasks.each do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end
json.pending @pending.each do |list|
    json.id list.id
    json.title list.title
    json.status list.status
    json.tasks list.tasks.each do |task|
        json.id task.id
        json.content task.content
        json.completed task.completed
    end
end

