class GamesController < ApplicationController
  respond_to :html, :xml
  
  before_filter :ensure_user_is_logged_in, :only => [:lobby, :match]
  before_filter :set_game, :only => [:lobby, :match]
  
  before_filter :get_activities, :only => :index
  
  def index
    @title = t("navigation.games")
    @games = Game.all
  end
  
  def show
    @game = Game.where("custom LIKE ?", '%' + params[:name] + '%').limit(1)
    if @game.nil?
      redirect_to games_path
    else
      @game = @game[0]
      @title = t(@game.translate_title).titleize
      respond_with(@game)
    end
  end

  def lobby
    @title = t(@game.name.downcase)
    
    #TODO activity user logged into this lobby
    respond_with(@game)
  end
  
  def match
    #TODO activity user playing this game
    @room = Room.find_by_name(params[:name])
    respond_with(@game)
  end
  
  private
    def set_game
      @game = Game.find_by_name(params[:id])
    end
end
