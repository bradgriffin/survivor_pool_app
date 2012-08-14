require 'spec_helper'

describe "Pool pages" do

	subject { page }

	let(:user) { FactoryGirl.create(:user) }
  	before { sign_in user }

	describe "pool creation page" do
		before { visit new_pool_path }

		it { should have_selector('h1', text: 'Create Pool') }
		it { should have_selector('title', text: 'Create Pool')}
	end

	describe "pool creation" do
	    before { visit new_pool_path }

	    describe "with invalid information" do

	      it "should not create a pool" do
	        expect { click_button "Add Pool" }.should_not change(Pool, :count)
	      end

	      describe "error messages" do
	        before { click_button "Add Pool" }
	        it { should have_content('Try again') } 
	      end
	    end

	    describe "with valid information" do	      	
	  		before { fill_in 'pools[name]', with: "Tester" }
	  		before { fill_in 'pools[description]', with: "Lorem ipsum" }
	  		before { fill_in 'pools[password]', with: "foobar" }
	  		before { fill_in 'pools[password_confirmation]', with: "foobar" }

	  		it "should create a pool" do
	        	expect { click_button "Add Pool" }.should change(Pool, :count).by(1)
	      	end
	    end
	end

	describe "pool show page" do
		let!(:pool) { FactoryGirl.create(:pool, user: user) }

		before { visit pool_path(pool) }

		it { should have_selector('h1', text: 'Rankings') }
		it { should have_selector('title', text: user.username) }

		describe "main table" do
			it { should_not have_link(user.username) }

			describe "with no entries" do
				let!(:membership) { FactoryGirl.create(:membership, user: user, pool: pool) }
				before { visit pool_path(pool) }

				it { should have_link(user.username, href: user_path(user)) }
				it { should have_content('No entry') }
			end

			describe "with a valid entry created" do
				let!(:membership) { FactoryGirl.create(:membership, user: user, pool: pool) }
  				let!(:entry) { FactoryGirl.create(:entry, user: user, pool: pool) }
				before { visit pool_path(pool) }

				it { should have_link(user.username, href: user_path(user)) }
				it { should have_link(entry.name, href: entry_path(entry)) }
			end
		end
	end
end