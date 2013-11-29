namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_dishes
    make_assets
  end
end

def make_users
  admin = User.create!(name: "Matt Li",
                 email: "mtl858@gmail.com",
                 city: "Los Angeles, California",
                 password: "lemontea",
                 password_confirmation: "lemontea",
                 admin: true)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@chefapp.com"
    password  = "password"
    User.create!(name: name,
                   email: email,
                   city: "Los Angeles, CA",
                   password: password,
                   password_confirmation: password)
  end
end

def make_dishes
  users = User.all(limit: 35)
    1.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.dishes.build(name: "Wonton Soup", description: content); user.save! }
    end
end

def make_assets
  root_url = "/images/:style/missing.png"
  dishes = Dish.all
    2.times do
      dishes.each { |dish| dish.assets.build(); dish.save! }
    end
end