class House < ActiveRecord::Base
  belongs_to :department
  attr_accessible :address, :address2, :name, :number, :phone, :department_id
  has_many :users
end
