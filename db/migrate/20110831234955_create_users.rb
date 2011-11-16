class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :nickname, :fullname, :email, :ip_address, :provider, :session, :uid, :location, :avatar_url
      t.integer :status, :default => 1
      t.boolean :vip, :default => false
      t.datetime :created_date, :logged_date
      t.integer :sign_count, :default => 1
    end
    
    add_index :users, :session
  end

  def self.down
    drop_table :users
  end
end
