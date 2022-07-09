1.times do |user|
    User.create(
        username: "someuser",
        password: "asdfasdf",
        first_name: "Test",
        last_name: "User",
        email: "asdf@asdf.com"
    )
end

5.times do |project|
    Project.create(
        title: Faker::DcComics.title,
        description: Faker::ChuckNorris.fact,
        github_url: "www.github.com/project#{Faker::Games::Pokemon.name}",
        public: Faker::Boolean.boolean,
        user_id: 1
    )
end

25.times do |feature|
    Feature.create(
        title: Faker::TvShows::Simpsons.character,
        description: Faker::TvShows::SouthPark.quote,
        due_date: "02/#{1..28}/2023",
        public: Faker::Boolean.boolean,
        project_id: rand(1..5)
    )
end

50.times do 
    Note.create(
        notable: Project.find_by(id: rand(1..5)),
        content: Faker::TvShows::FamilyGuy.quote,
        user_id: 1
    )
end

50.times do 
    Note.create(
        notable: Feature.find_by(id: rand(1..25)),
        content: Faker::TvShows::FamilyGuy.quote,
        user_id: 1
    )
end

15.times do |list|
    List.create(
        listable: Project.find_by(id: rand(1..5)),
        title: Faker::Movies::Departed.quote,
        user_id: 1
    )
end

75.times do
    List.create(
        listable: Feature.find_by(id: rand(1..25)),
        title: Faker::Movies::Lebowski.quote,
        user_id: 1
    )
end

375.times do 
    Task.create(
        content: Faker::Games::SuperSmashBros.fighter,
        completed: Faker::Boolean.boolean,
        list_id: rand(1..90),
        user_id: 1
    )
end