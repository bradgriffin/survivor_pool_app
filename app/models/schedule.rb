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

  @current_time = Time.new

  def self.current_week(time)
    @week1 = Time.new(2012,9,10,22,15,0,"-05:00")
    @week2 = Time.new(2012,9,17,22,30,0,"-05:00")
    @week3 = Time.new(2012,9,24,22,30,0,"-05:00")
    @week4 = Time.new(2012,10,1,22,30,0,"-05:00")
      
    if time < @week1
      return 1
    elsif time > @week1 && time < @week2
      return 2
    elsif time < @week2 && time < @week3
      return 3
    elsif time < @week3 && time < @week4
      return 4
    end
  end

  scope :with_current_week, find_all_by_week(current_week(@current_time))
end
