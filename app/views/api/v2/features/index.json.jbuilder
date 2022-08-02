json.features do
    json.array! @features, partial: "feature", as: :feature
end

json.counts do
    json.priority @priority_counts
    json.status @stauts_counts
end
