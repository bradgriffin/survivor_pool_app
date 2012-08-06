class User < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :username, :email, :password, :password_confirmation
	has_many :pools, dependent: :destroy
	has_many :memberships, :through => :pools
	has_secure_password

	before_save { self.email.downcase! }
	before_save :create_remember_token

	validates :username, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  						uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
	validates_associated :pools

	private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
