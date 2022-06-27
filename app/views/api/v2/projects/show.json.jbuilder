json.id @project.id
json.title @project.title
json.description @project.description
json.github_url @project.github_url
json.public @project.public
json.features @project.features.each do |feature|
    json.id feature.id
    json.title feature.title
    json.description feature.description
    json.due_date feature.due_date
    json.public feature.public
end
json.notes @project.project_notes do |note|
    json.id note.id
    json.title note.title
    json.content note.content
    json.created note.created_at
end
json.lists @project.project_list do |list|
    json.id list.id
    json.title list.title
end