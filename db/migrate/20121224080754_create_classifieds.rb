class CreateClassifieds < ActiveRecord::Migration
  def change
    create_table :classifieds do |t|
      t.datetime :date
      t.string :description
      t.float :price
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
