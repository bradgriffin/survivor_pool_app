class Pool < ActiveRecord::Base
	belongs_to :user

	attr_accessible :name, :description, :password, :password_confirmation
	has_secure_password

	validates_presence_of :name, :description, :user_id
	validates_uniqueness_of :name
end
