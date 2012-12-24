class Classified < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :date, :description, :price, :user_id
  validates		:description, presence: true
end
