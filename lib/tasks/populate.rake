namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do    
    [User, Room, Stats].each(&:delete_all)
    
    
    USERS_MAX = 100
    
    user = User.new
    user.nickname = "jamal"
    user.fullname = "haha"
    user.email = "js@mmlink.dk"
    user.session = "testerne"
    user.uid = "2343"
    user.avatar_url = "http://www.clbbbl.dk/phpbb/download/file.php?avatar=11_1216741839.gif"
    user.vip = true
    user.save
    
    game = Game.new
    game.name = "tawle"
    game.zone = "games"
    game.host = "localhost"
    game.max_users = 2
    game.save
    
    User.populate USERS_MAX do |user|
      user.fullname = Faker::Name.name
      user.nickname = user.fullname.gsub(' ', '_').downcase
      user.email = Faker::Internet.email
      user.created_date = 2.years.ago..1.years.ago
      user.logged_date = 1.years.ago..Time.now
      user.sign_count = rand(1 + 10000)
      user.provider = ['facebook','yahoo','twitter','open_id','linked_in','google']
      user.location = Faker::Address.city
        Room.populate 2..5 do |room|
          room.name = Populator.words(1)
          room.game_id = 1
          room.started_date = 30.minutes.ago..25.minutes.ago
          room.ended_date = 15.minutes.ago..Time.now
          room.creator_id = user.id
          
          win_or_lose = rand(2) + 1
          stats = Stats.find_or_create_by_user_id_and_game_id(user.id, 1)
          if win_or_lose == 1
            stats.win += 1
            stats.points += rand(50) + 50
          else
            stats.loss += 1
            stats.points -= rand(50) + 50
          end
          stats.save
          
          stats = Stats.find_or_create_by_user_id_and_game_id((rand(USERS_MAX)+1), 1)
          if win_or_lose == 1
            stats.loss += 1
            stats.points -= rand(50) + 50
          else
            stats.win += 1
            stats.points += rand(50) + 50
          end
          stats.save
          
        end
    end
  end
end