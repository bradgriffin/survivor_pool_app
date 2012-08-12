FactoryGirl.define do 
	factory :user do
		sequence(:username)  { |n| "user#{n}" }
		sequence(:first_name)  { |n| "First #{n}" }
		sequence(:last_name)  { |n| "Last #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com"}
		password	"foobar"
		password_confirmation	"foobar"

		factory :admin do
			admin true
		end
	end

	factory :pool do
		name "Tester"
		description "Lorem ipsum"
		password "foobar"
		password_confirmation "foobar"
		user
	end

	factory :team do
		sequence(:location) { |n| "City#{n}" }
		sequence(:nickname) { |n| "Mascot#{n}" }
		division "NFL Division"
		sequence(:coach) { |n| "Example Coach#{n}" }
		wins_2011 2
		losses_2011 14
		wins_2012 4
		losses_2012 12
	end

	factory :membership do
		pool
		user
	end

	factory :entry do
		name "Example Entry"
		user 
		pool
	end

	factory :schedule do
		week 1
		date "1/1/2012"
		time "12:00:00"
		away_team_id 1
		home_team_id 2
	end

	factory :selection do
		entry
		user
		schedule
		selected_team_id 1
	end
end