require 'spec_helper'

describe "Selection pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  let(:membership) { FactoryGirl.create(:membership, user: user, pool: pool) }
  let(:team1) { FactoryGirl.create(:team) }
  let(:team2) { FactoryGirl.create(:team) }
  let(:schedule) { FactoryGirl.create(:schedule) }
  let(:entry) { FactoryGirl.create(:entry, user: user, pool: pool) }

  describe "selection creation page" do
    before { visit new_selection_path }

    it { should have_selector('h1', text: 'Make your Selections') }
    it { should have_selector('title', text: 'Create Selection')}
  end

end