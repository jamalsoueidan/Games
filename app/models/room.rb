class Room < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => :creator_id
  belongs_to :game
  has_many :stats, :class_name => "Stats"
end
