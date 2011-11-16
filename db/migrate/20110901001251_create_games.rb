class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name, :zone, :host
      t.integer :port, :default => 9933
      t.integer :http_port, :default => 8080
      t.boolean :debug, :default => false
      t.integer :max_users, :default => 0
    end
  end

  def self.down
    drop_table :games
  end
end