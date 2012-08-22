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

  before { @result = schedule.result }

  subject { @result }

  it { should respond_to(:schedule_id) }
  it { should respond_to(:away_team_score) }
  it { should respond_to(:home_team_score) }
  it { should respond_to(:winning_team_id) }
  it { should respond_to(:schedule) }
  it { should respond_to(:winning_team) }

  it { should be_valid }

  describe "when schedule_id is not present" do
    before { @result.schedule_id = nil }
    it { should_not be_valid }
  end

  describe "when away_team_score is not present" do
    before { @result.away_team_score = nil }
    it { should_not be_valid }
  end

  describe "when home_team_score is not present" do
    before { @result.home_team_score = nil }
    it { should_not be_valid }
  end
end
