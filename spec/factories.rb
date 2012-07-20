FactoryGirl.define do 
	factory :user do
		first_name	"Brad"
		last_name 	"Griffin"
		username	"bgriffin20"
		email		"bgriffin20@gmail.com"
		password	"foobar"
		password_confirmation	"foobar"
	end
end