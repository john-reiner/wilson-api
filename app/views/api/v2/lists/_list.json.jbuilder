json.id list.id
json.title list.title
json.status list.status
json.author do 
    json.initials list.user.first_name[0] + list.user.last_name[0]
    json.full_name list.user.first_name + " " + list.user.last_name
end
json.modified list.updated_at