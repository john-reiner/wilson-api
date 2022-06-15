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
        content: "Test Note description for Note #{note + 1}"
        project_id: rand(1..5)
    )
end