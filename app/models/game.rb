class Game < ActiveRecord::Base
  has_many :rooms
  
  def translate
    name.gsub(' ', '_').downcase
  end
  
  def translate_title
    'games.' + translate + '.title'
  end
  
  def translate_short_description
    'games.' + translate + '.short_description'
  end
  
  def translate_long_description
    'games.' + translate + '.long_description'
  end
  
  def translate_teach
    'games.' + translate + '.teach'    
  end
  
  validates_presence_of :name
end
