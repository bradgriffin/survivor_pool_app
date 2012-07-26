require 'spec_helper'

describe Team do
  before { @team = Team.new(location: "City", nickname: "Mascot",
  							division: "NFL Division", coach: "Example Coach",
  							wins_2011: 8, losses_2011: 8, 
  							wins_2012: 10, losses_2012: 6) }

  subject { @team }

  it { should respond_to(:location) }
  it { should respond_to(:nickname) }
  it { should respond_to(:division) }
  it { should respond_to(:coach) }
  it { should respond_to(:wins_2011) }
  it { should respond_to(:losses_2011) }
  it { should respond_to(:wins_2012) }
  it { should respond_to(:losses_2012) }

  it { should be_valid }

  describe "when location is not present" do
  	before { @team.location = " " }
  	it {should_not be_valid}
  end

  describe "when nickname is not present" do
  	before { @team.nickname = " " }
  	it {should_not be_valid}
  end

  describe "when nickname is already taken" do
    before do
      team_with_same_nickname = @team.dup
      team_with_same_nickname.nickname = @team.nickname.upcase
      team_with_same_nickname.save
    end

    it { should_not be_valid }
  end

  describe "when division is not present" do
  	before { @team.division = " " }
  	it {should_not be_valid}
  end

  describe "when coach is not present" do
  	before { @team.coach = " " }
  	it {should_not be_valid}
  end

  describe "when coach is already taken" do
    before do
      team_with_same_coach = @team.dup
      team_with_same_coach.coach = @team.coach.upcase
      team_with_same_coach.save
    end

    it { should_not be_valid }
  end

  describe "when 2011 wins is not present" do
  	before { @team.wins_2011 = " " }
  	it {should_not be_valid}
  end

  describe "when 2011 losses is not present" do
  	before { @team.losses_2011 = " " }
  	it {should_not be_valid}
  end

  describe "when 2012 wins is not present" do
  	before { @team.wins_2012 = " " }
  	it {should_not be_valid}
  end

  describe "when 2012 losses is not present" do
  	before { @team.losses_2012 = " " }
  	it {should_not be_valid}
  end
end
