class Selection < ActiveRecord::Base
	belongs_to :entry
	belongs_to :user
	belongs_to :schedule
end
