require 'spec_helper'

describe Selection do
  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  let(:membership) { FactoryGirl.create(:membership, user: user, pool: pool) }
  let(:team1) { FactoryGirl.create(:team) }
  let(:team2) { FactoryGirl.create(:team) }
  let(:schedule) { FactoryGirl.create(:schedule) }
  let(:entry) { FactoryGirl.create(:entry, user: user, pool: pool) }

  before { @selection = entry.selections.build(entry_id: entry, user_id: user, 
  						schedule_id: schedule, selected_team_id: team1) }

  subject { @selection }

  it { should respond_to(:entry_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:schedule_id) }
  it { should respond_to(:selected_team_id) }

  it { should be_valid }

end