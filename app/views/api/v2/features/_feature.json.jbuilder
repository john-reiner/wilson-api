json.id feature.id
json.title feature.title
json.description feature.description
json.due_date feature.due_date
json.public feature.public
json.project_id feature.project_id
json.created feature.created_at
json.modified feature.updated_at
json.status feature.status
json.priority feature.priority
json.author do 
    json.initials feature.user.first_name[0] + feature.user.last_name[0]
    json.full_name feature.user.first_name + " " + feature.user.last_name
end