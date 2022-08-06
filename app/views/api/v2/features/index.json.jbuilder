json.features do
    json.array! @features, partial: "feature", as: :feature
end

json.counts do
    json.priorities @priority_counts
    json.statuses @stauts_counts
end
