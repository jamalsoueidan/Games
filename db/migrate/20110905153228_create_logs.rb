class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.string :user_id
      t.integer :by_type, :default => 0
      t.datetime :credit_date
      t.integer :points, :default => 0
      t.belongs_to :room, :game
    end
    
    add_index :logs, :user_id
    add_index :logs, [:user_id, :by_type, :game_id]
    add_index :logs, [:user_id, :game_id]
    
     #by type
     # 0 = logged points
     # 1 = win points
     # 2 = lost points
  end

  def self.down
    drop_table :logs
  end
end
