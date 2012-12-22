class Trade < ActiveRecord::Base
  attr_accessible :date, :flipflop, :worktrade, :description
  belongs_to :user
  
  validates :user_id,	presence: true
  validates :date,		presence: true
  
  default_scope order: 'trades.date ASC'
end
