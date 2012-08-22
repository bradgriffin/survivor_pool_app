class Schedule < ActiveRecord::Base
	belongs_to :away_team, class_name: "Team"
	belongs_to :home_team, class_name: "Team"
	has_many :selections, :through => :entries
	has_one :result

	attr_accessible :week, :datetime, :away_team_id, :home_team_id

	validates :week, :datetime, :away_team_id, :home_team_id, presence: true

  before_create :create_game_result

  def create_game_result
    create_result(away_team_score: 0, home_team_score: 0)
  end
end
