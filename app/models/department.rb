class Department < ActiveRecord::Base
  attr_accessible :city, :name, :state
  has_many :houses
end
