class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first
      t.string :last
      t.string :phone
      t.string :ident
      t.references :house

      t.timestamps
    end
    add_index :users, :house_id
  end
end
