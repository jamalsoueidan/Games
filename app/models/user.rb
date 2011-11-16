class User < ActiveRecord::Base
  has_many :activities
  has_many :stats, :class_name => "Stats" do
    def winners
      self.where(:by_type => Stats::BY_WINNER)
    end
    
    def losers
      self.where(:by_type => Stats::BY_LOSER)
    end
  end
  
  self.per_page = 10
  
  #status
  STANDARD = 1
  MODERATOR = 2
  ADMIN = 3
  
  DEFAULT_AVATAR_URL = "http://localhost:3000/images/default_avatar.png"
  
  def self.new_omniauth(auth)
    user = User.new
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    
    if auth["user_info"]
      user.email = auth["user_info"]["email"]
      user.fullname = auth["user_info"]["name"]
      user.nickname = auth["user_info"]["nickname"]
      
      if auth["user_info"]["image"].nil?
        user.avatar_url = DEFAULT_AVATAR_URL
      else
        user.avatar_url = auth["user_info"]["image"]
      end
    end
    
    user.created_date = DateTime.new
    
    return user
  end
  
  def self.find_with_auth(params)
    return find_by_provider_and_uid(params["provider"], params["uid"])
  end  
  
  def update_session!(params={})
    update = {:session => User.generate_session, :sign_count => self.sign_count+1, :logged_date => Time.new}
    update.merge!(params)
    self.update_attributes(update)
    # TODO: only add logged in message when user return after 20 min, so users don't login and out all the time
    self.activities.create(:message => Activity::LOGGED_IN)
  end
  
  def self.generate_session(size = 24)
    charset = %w{ 2 3 4 6 7 9 A C D E F G H J K M N P Q R T V W X Y Z}
    (0...size).map{ charset.to_a[rand(charset.size)] }.join
  end
  
  def created_date
    date = read_attribute(:created_date)
    if date.nil?
      return '-'
    else
      return date
    end
  end
  
  def is_admin?
    self.status == ADMIN
  end
  
  def is_moderator?
    self.status == MODERATOR
  end
  
  validates_uniqueness_of :nickname
  validates_uniqueness_of :email
  
  validates_presence_of :nickname
  validates_presence_of :fullname
  validates_presence_of :email
end
