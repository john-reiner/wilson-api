json.id project.id
json.title project.title
json.description project.description
json.github_url project.github_url
json.image project.image
json.author do 
    json.initials project.user.first_name[0] + project.user.last_name[0]
    json.full_name project.user.first_name + " " + project.user.last_name
end
json.features_count project.features.count
json.created project.created_at
json.modified project.updated_at
json.color project.color
json.color_name project.color_name
json.features_data do 
    json.total project.features.count
    json.status do 
        json.created project.features.where(status: "created").count
        json.paused project.features.where(status: "paused").count
        json.working project.features.where(status: "working").count
        json.ready project.features.where(status: "ready").count
        json.completed project.features.where(status: "completed").count
    end
    json.priorities do 
        json.low project.features.where(priority: "low").count
        json.medium project.features.where(priority: "medium").count
        json.high project.features.where(priority: "high").count
    end
end