#--
# user.rb
# Author: Austin Riba
# Created at: 2012-12-19
#++

class User < ActiveRecord::Base
  belongs_to :house
  attr_accessible :email, :first, :ident, :last, :phone, :house_id, :password, :password_confirmation, :rank, :passoword_reset_sent_at
  has_secure_password
  has_many :trades, dependent: :destroy
  has_many :classifieds, dependent: :destroy
  
  before_save { |user| user.email = email.downcase}
  before_save :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_IDENT_REGEX = /\A[a-zA-z]{2}\d{4}\z/
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }
  validates :first, presence: true, length: { maximum: 50 }
  validates :last, presence: true, length: { maximum: 50 }
  validates :ident, presence: true, format: { with: VALID_IDENT_REGEX }
  
  def feed
	Trade.current
  end
  
  def battalion_feed
		user_ids = "SELECT id from users u where u.house_id IN(
					SELECT id  from houses where battalion = :battalion)"
		Trade.current.where("user_id in (#{user_ids})", battalion: house.battalion)
 end
 
 def send_password_reset
	self.password_reset_token = SecureRandom.urlsafe_base64
	self.password_reset_sent_at = Time.zone.now
	save!(validate: false)
	UserMailer.password_reset(self).deliver
 end
  
  private 
	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end
