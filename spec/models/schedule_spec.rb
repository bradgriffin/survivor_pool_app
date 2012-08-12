require 'spec_helper'

describe Schedule do
  before { @schedule = Schedule.new(week: 1, date: "2012-09-01", 
  					time: "12:00:00 CDT", away_team_id: 1, 
  					home_team_id: 2) }

  subject { @schedule }

  it { should respond_to(:week) }
  it { should respond_to(:date) }
  it { should respond_to(:time) }
  it { should respond_to(:away_team_id) }
  it { should respond_to(:home_team_id) }
  it { should respond_to(:away_team) }
  it { should respond_to(:home_team) }


  it { should be_valid }

  describe "when week is not present" do
  	before { @schedule.week = "" }
  	it {should_not be_valid}
  end

  describe "when date is not present" do
  	before { @schedule.date = "" }
  	it {should_not be_valid}
  end

  describe "when time is not present" do
  	before { @schedule.time = "" }
  	it {should_not be_valid}
  end

  describe "when away_team_id is not present" do
  	before { @schedule.away_team_id = "" }
  	it {should_not be_valid}
  end

  describe "when home_team_id is not present" do
  	before { @schedule.home_team_id = "" }
  	it {should_not be_valid}
  end

end