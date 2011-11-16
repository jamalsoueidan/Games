class Activity < ActiveRecord::Base
  belongs_to :user
  
  LOGGED_IN = 'activity.logged_in'
end
