class Result < ActiveRecord::Base
	belongs_to :schedule
	belongs_to :winning_team, class_name: "Team"

	attr_accessible :away_team_score, :home_team_score, :winning_team_id
end
