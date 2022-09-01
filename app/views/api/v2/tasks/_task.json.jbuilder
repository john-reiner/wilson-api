json.id task.id
json.content task.content
json.completed task.completed
json.description task.description
json.due_date task.due_date
json.list_info do 
    json.title task.list.title
    json.status task.list.status
end
json.author do 
    json.initials task.user.first_name[0] + task.user.last_name[0]
    json.full_name task.user.first_name + " " + task.user.last_name
end