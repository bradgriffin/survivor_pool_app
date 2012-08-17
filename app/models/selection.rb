class Selection < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	belongs_to :schedule

	attr_accessible :user_id, :schedule_id, :selected_team_id

	validates :user_id, :schedule_id, :selected_team_id, :entry_id, presence: true
end
