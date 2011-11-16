class CreateRooms < ActiveRecord::Migration
  def self.up
    create_table :rooms do |t|
      t.string :name
      t.integer :creator_id
      t.belongs_to :game
      t.datetime :started_date, :ended_date
    end
    
    add_index :rooms, :creator_id
  end

  def self.down
    drop_table :rooms
  end
end
