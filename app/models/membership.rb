class Membership < ActiveRecord::Base
	belongs_to :pool
  belongs_to :user

	validates :pool_id, :user_id, presence: true
end
