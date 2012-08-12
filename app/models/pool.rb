class Pool < ActiveRecord::Base
	has_many :memberships, dependent: :destroy
	has_many :entries, dependent: :destroy
	belongs_to :user


	attr_accessible :name, :description, :password, :password_confirmation
	has_secure_password

	validates :name, :description, :password, :password_confirmation, 
				:user_id, presence: true
	validates :name, uniqueness: true
	validates :password, length: { minimum: 4 }
end
