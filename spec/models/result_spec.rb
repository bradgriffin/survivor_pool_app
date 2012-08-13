require 'spec_helper'

describe Result do
  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  let(:membership) { FactoryGirl.create(:membership, user: user, pool: pool) }
  let(:team1) { FactoryGirl.create(:team) }
  let(:team2) { FactoryGirl.create(:team) }
  let(:schedule) { FactoryGirl.create(:schedule) }
  let(:entry) { FactoryGirl.create(:entry, user: user, pool: pool) }
  let(:selection) { FactoryGirl.create(:selection, entry: entry, user: user, schedule: schedule) }

  before { @result = schedule.results.build(away_team_score: 24, home_team_score: 21, 
  						winning_team_id: team1.id) }

  subject { @result }

  it { should respond_to(:schedule_id) }
  it { should respond_to(:away_team_score) }
  it { should respond_to(:home_team_score) }
  it { should respond_to(:winning_team_id) }
  it { should respond_to(:schedule) }
  it { should respond_to(:winning_team) }

  it { should be_valid }
end
