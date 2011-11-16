class Stats < ActiveRecord::Base
  BY_LOGGED = 0
  BY_WINNER = 1
  BY_LOSER = 2
   
  belongs_to :user
  belongs_to :game
  belongs_to :room
end
