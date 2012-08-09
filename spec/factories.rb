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
		location "City"
		nickname "Mascot"
		division "NFL Division"
		coach "Bob Example"
		wins_2011 2
		losses_2011 14
		wins_2012 4
		losses_2012 12
	end

	factory :membership do
		pool
		user
	end

end