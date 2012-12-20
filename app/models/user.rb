#--
# user.rb
# Author: Austin Riba
# Created at: 2012-12-19
#++

class User < ActiveRecord::Base
  belongs_to :house
  attr_accessible :email, :first, :ident, :last, :phone, :house_id, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase}
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_IDENT_REGEX = /\A[a-zA-z]{2}\d{4}\z/
  
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }
  validates :first, presence: true, length: { maximum: 50 }
  validates :last, presence: true, length: { maximum: 50 }
  validates :ident, presence: true, format: { with: VALID_IDENT_REGEX }
end
