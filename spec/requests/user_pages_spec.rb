require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "index" do
		
		let(:user) { FactoryGirl.create(:user) }

    	before(:all) { 30.times { FactoryGirl.create(:user) } }
    	after(:all)  { User.delete_all }

	    before(:each) do
	    	sign_in user
	    	visit users_path
	    end

		it { should have_selector('title', text: 'All Users') }
		it { should have_selector('h1', text: 'All Users') }

		describe "pagination" do

	      	it { should have_selector('div.pagination') }

	      	it "should list each user" do
	        	User.paginate(page: 1).each do |user|
	        		page.should have_selector('li', text: user.username)
	        	end
	      	end
    	end

    	describe "delete links" do

      		it { should_not have_link('delete') }

      		describe "as an admin user" do
        		let(:admin) { FactoryGirl.create(:admin) }
        		before do
        			sign_in admin
        			visit users_path
    			end

        		it { should have_link('delete', href: user_path(User.first)) }
        		it "should be able to delete another user" do
        			expect { click_link('delete') }.to change(User, :count).by(-1)
        		end
        		it { should_not have_link('delete', href: user_path(admin)) }
      		end
    	end
    end

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

			describe "after submission" do
				before { click_button submit }

				it { should have_selector('title', text: 'Sign Up') }
				it { should have_content('error') }
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

			describe "after saving user" do
				before { click_button submit }
				let(:user) { User.find_by_username('example01') }

				it { should have_selector('title', text: user.username) }
				it { should have_selector('div.alert.alert-success', text: 'Welcome') }
				it { should have_link('Sign Out') }
			end
		end
	end

	describe "edit" do
	    let(:user) { FactoryGirl.create(:user) }
	    before do
	    	sign_in user
	    	visit edit_user_path(user)
	    end

	    describe "page" do
	    	it { should have_selector('h1',    text: "Update your profile") }
	      it { should have_selector('title', text: "Edit User") }
	      it { should have_link('Change', href: 'http://gravatar.com/emails') }
	    end

	    describe "with invalid information" do
	      before { click_button "Save changes" }

	      it { should have_content('error') }
	    end

	    describe "with valid information" do
	      let(:new_first_name)  { "New First Name" }
	      let(:new_last_name)  { "New Last Name" }
	      let(:new_username)  { "New Username" }
	      let(:new_email) { "new@example.com" }
	      before do
	        fill_in "Username",             with: new_username
	        fill_in "First Name",             with: new_first_name
	        fill_in "Last Name",             with: new_last_name
	        fill_in "Email",            with: new_email
	        fill_in "Password",         with: user.password
	        fill_in "Confirm Password", with: user.password
	        click_button "Save changes"
	      end

	      it { should have_selector('title', text: new_username) }
	      it { should have_selector('div.alert.alert-success') }
	      it { should have_link('Sign Out', href: signout_path) }
	      specify { user.reload.username.should  == new_username }
	      specify { user.reload.email.should == new_email }
	    end
  	end
end