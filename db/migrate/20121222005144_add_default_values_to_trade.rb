class AddDefaultValuesToTrade < ActiveRecord::Migration
  def change
	change_column :trades, :flipflop, :boolean, default: false
	change_column :trades, :worktrade, :boolean, default: false
  end
end
