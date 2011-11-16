class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.belongs_to :user
      t.text :message
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :activities
  end
end
