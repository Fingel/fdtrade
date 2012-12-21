class AddBattalionToHouse < ActiveRecord::Migration
  def change
    add_column	:houses, :battalion, :integer
	add_index	:houses, :battalion
  end
end
