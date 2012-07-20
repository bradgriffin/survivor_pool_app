require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) }
		before { visit user_path(user)}

		it { should have_selector('h1', text: user.username) }
		it { should have_selector('title', text: user.username) } 
	end

	describe "signup page" do
		before { visit signup_path }

		it { should have_selector('h1', text: 'Sign Up') }
		it { should have_selector('title', text: 'Sign Up')}
	end

	describe "signup" do
		before { visit signup_path }

		let(:submit) { "Create my account" }

		describe "with invalid information" do
			it "should not create a user" do
				expect { click_button submit }.not_to change(User, :count)
			end
		end

		describe "with valid information" do
			before do
				fill_in "First Name",			with: "Example"
				fill_in "Last Name",			with: "User"
				fill_in "Username",				with: "example01"
				fill_in "Email", 				with: "test@example.com"
				fill_in "Password",				with: "foobar"
				fill_in "Confirm Password",		with: "foobar"
			end

			it "should create a user" do 
				expect { click_button submit }.to change(User, :count).by(1)
			end
		end
	end
end