namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(username: "bgriffin20",
                         first_name: "Brad",
                         last_name: "Griffin",
                         email: "bgriffin20@gmail.com",
                         password: "smokies20",
                         password_confirmation: "smokies20")
    admin.toggle!(:admin)
    99.times do |n|
      username  = "example-#{n+1}"
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(username: username,
                   first_name: first_name,
                   last_name: last_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end