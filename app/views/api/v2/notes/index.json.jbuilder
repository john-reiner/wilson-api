json.notes @notes.each do |note|
    json.id note.id
    json.content note.content
    json.created note.created_at
end