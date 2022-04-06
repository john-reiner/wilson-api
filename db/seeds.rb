5.times do |user|
    User.create(
        username: "testuser#{user + 1}",
        password: "password#{user + 1}"
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