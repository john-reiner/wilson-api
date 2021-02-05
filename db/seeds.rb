# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


5.times do |user|
    User.create!(
        username: "testuser#{user + 1}",
        password: "asdf#{user + 1}"
    )
end

25.times do |goal|
    Goal.create!(
        name: "Goal #{goal + 1}",
        description: "Goal #{goal + 1} description.",
        user_id: rand(1..5),
        rgb: "rgb(#{rand(1..255)},#{rand(1..255)},#{rand(1..255)})",
        due_date: "#{rand(1..12)}-#{rand(1..29)}-2022"
    )
end

75.times do |task|
    Task.create!(
        name: "Task #{task + 1}",
        goal_id: rand(1..25)
    )
end