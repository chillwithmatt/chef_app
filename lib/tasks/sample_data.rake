namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         city: "Los Angeles, CA"
                         password: "foobar",
                         password_confirmation: "foobar",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      city = "city"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   city: city,
                   password: password,
                   password_confirmation: password)
    end
  end
end