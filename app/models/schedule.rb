class Schedule < ActiveRecord::Base
	belongs_to :away_team, class_name: "Team"
	belongs_to :home_team, class_name: "Team"
	has_many :selections, :through => :entries

	attr_accessible :week, :date, :time, :away_team_id, :home_team_id

	validates :week, :date, :time, :away_team_id, :home_team_id, presence: true
end
