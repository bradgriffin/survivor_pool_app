class Team < ActiveRecord::Base
	attr_accessible :location, :nickname, :division, :coach, :wins_2011, :losses_2011, :wins_2012, :losses_2012

	validates :location, presence: true
	validates :nickname, presence: true, uniqueness: { case_sensitive: false }
	validates :division, presence: true
	validates :coach, presence: true, uniqueness: { case_sensitive: false }
	validates :wins_2011, presence: true
	validates :losses_2011, presence: true
	validates :wins_2012, presence: true
	validates :losses_2012, presence: true
	
end
