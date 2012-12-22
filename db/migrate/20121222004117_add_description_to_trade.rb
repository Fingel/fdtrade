class AddDescriptionToTrade < ActiveRecord::Migration
  def change
    add_column :trades, :description, :text
  end
end
