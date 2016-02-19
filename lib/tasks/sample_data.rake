namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Ilnar",
                 email: "25gaisarov@gmail.com",
                 password: "104Hmoa)",
                 password_confirmation: "104Hmoa)")
    User.create!(name: "ALsu",
                 email: "alsu1111@gmail.com",
                 password: "0123456789",
                 password_confirmation: "0123456789")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end
