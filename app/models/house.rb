class House < ActiveRecord::Base
  belongs_to :department
  attr_accessible :address, :address2, :name, :number, :phone, :department_id, :battalion
  has_many :users
  default_scope order: 'houses.number ASC'
end
