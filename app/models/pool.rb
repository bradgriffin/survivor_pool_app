class Pool < ActiveRecord::Base
	belongs_to :user

	attr_accessible :name, :description, :password, :password_confirmation
	has_secure_password

	before_save { self.name.downcase! }

	validates :name, :description, :password, :password_confirmation, 
				:user_id, presence: true
	validates :name, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 4 }
end
