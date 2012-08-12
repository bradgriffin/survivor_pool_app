class Entry < ActiveRecord::Base
	belongs_to :user
	belongs_to :pool
	has_many :selections

	validates :name, presence: true, length: { maximum: 14 }
	
end
