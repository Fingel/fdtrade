class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.integer :number
      t.string :address
      t.string :address2
      t.string :phone
      t.references :department

      t.timestamps
    end
    add_index :houses, :department_id
  end
end
