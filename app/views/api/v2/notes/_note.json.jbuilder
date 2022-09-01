json.id note.id
json.title note.title
json.content note.content
json.created note.created_at
json.modified note.updated_at
json.author do 
    json.initials note.user.first_name[0] + note.user.last_name[0]
    json.full_name note.user.first_name + " " + note.user.last_name
end