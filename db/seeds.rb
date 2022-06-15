1.times do |user|
    User.create(
        username: "testuser#{user + 1}",
        password: "password#{user + 1}",
        first_name: "First#{user + 1}",
        last_name: "Last#{user + 1}",
        email: "testemail#{user + 1}@test.com"
    )
end

5.times do |project|
    Project.create(
        title: "Test Project #{project + 1}",
        description: "test project description #{project + 1}",
        github_url: "www.github.com/project#{project + 1}",
        public: true,
        user_id: 1
    )
end

25.times do |feature|
    Feature.create(
        title: "Test Feature #{feature + 1}",
        description: "Test Feature Description #{feature + 1}",
        due_date: "02/03/2023",
        public: true,
        project_id: rand(1..5)
    )
end

25.times do |note|
    ProjectNote.create(
        title: "Test Note #{note + 1}",
        project_id: rand(1..5)
    )
end

# User.create(
#     username: "testuser",
#     password: "password",
#     password_confirmation: "password"
# )

# 5.times do |goal|
#     Goal.create(
#         name: "testgoal#{goal + 1}",
#         description: "descritpion for testgoal#{goal + 1}",
#         completed: false,
#         rgb: "red",
#         user_id: 1
#     )

# end