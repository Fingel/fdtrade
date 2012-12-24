class AddIndexToClassifieds < ActiveRecord::Migration
  def change
	add_index :classifieds, :user_id
  end
end
