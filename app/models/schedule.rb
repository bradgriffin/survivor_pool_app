class Schedule < ActiveRecord::Base
	attr_accessible :week, :date, :time, :away_team_id, :home_team_id

	validates :week, :date, :time, :away_team_id, :home_team_id, presence: true
end
