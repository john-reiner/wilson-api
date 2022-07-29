json.counts do 
    json.all @lists.count
    json.completed @completed.count
    json.ready @ready.count
    json.working @working.count
    json.pending @pending.count
end

json.all do 
    json.array! @incomplete, partial: "list", as: :list
end

json.completed do 
    json.array! @completed, partial: "list", as: :list
end

json.ready do 
    json.array! @ready, partial: "list", as: :list
end

json.working do 
    json.array! @working, partial: "list", as: :list
end

json.pending do 
    json.array! @pending, partial: "list", as: :list
end