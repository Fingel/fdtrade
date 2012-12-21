class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.datetime :date
      t.boolean :flipflop
      t.boolean :worktrade
      t.integer :user_id

      t.timestamps
    end
    add_index :trades, [:user_id, :date]
  end
end
