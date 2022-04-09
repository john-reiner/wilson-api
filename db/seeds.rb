5.times do |user|
    User.create(
        username: "testuser#{user + 1}",
        password: "password#{user + 1}",
        first_name: "firstname#{user + 1}",
        last_name: "lastname#{user + 1}",
        email: "testemail#{user + 1}@test.com"
    )
end

20.times do |project|
    Project.create(
        title: "testprojecttitle#{project + 1}",
        description: "testprojectdescription#{project + 1}",
        github_url: "www.github.com/project#{project + 1}",
        public: false,
        user_id: rand(1..5)
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