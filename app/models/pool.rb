class Pool < ActiveRecord::Base
  belongs_to :user
	has_many :memberships, dependent: :destroy
	has_many :entries, dependent: :destroy

	attr_accessible :name, :description, :password, :password_confirmation
	has_secure_password

	validates :name, :description, :password, :password_confirmation, 
				:user_id, presence: true
	validates :name, uniqueness: true
	validates :password, length: { minimum: 4 }
end
