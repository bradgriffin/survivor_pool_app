class Entry < ActiveRecord::Base
	belongs_to :user
	belongs_to :pool

	validates :name, presence: true, length: { maximum: 14 }
	
end
