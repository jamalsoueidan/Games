class CreateStats < ActiveRecord::Migration
  def self.up
    create_table :stats do |t|
      t.integer :win, :default => 0
      t.integer :loss, :default => 0
      t.integer :disconnect, :default => 0
      t.integer :points, :default => 1000
      t.belongs_to :game
      t.belongs_to :user
    end
    
    add_index :stats, [:user_id, :game_id]
  end

  def self.down
    drop_table :stats
  end
end
