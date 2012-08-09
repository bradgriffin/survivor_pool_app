require 'spec_helper'

describe "Entry pages" do

	subject { page }

	describe "new page" do

		let(:user) { FactoryGirl.create(:user) }

		before do
			sign_in user
			visit new_entry_path
		end

		it { should have_selector('h1', text: 'Create a New Entry') }
		it { should have_selector('title', text: user.username) } 

		describe "entry creation" do
			before { visit new_entry_path }

			let(:submit) { "Add Entry" }

			describe "with invalid information" do
				it "should not create an entry" do
					expect { click_button submit }.not_to change(Entry, :count)
				end
			end
		end
	end
end
