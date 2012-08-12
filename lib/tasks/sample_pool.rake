namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user = User.first
    user.pools.create(name: "Test Pool"
    					password: "foobar"
    					password_confirmation: "foobar"
    					description: "This is a test pool."
    					user_id: user.id)
  end
end