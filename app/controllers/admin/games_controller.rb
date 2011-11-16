class Admin::GamesController < AdminController
  def index
    @games = Game.paginate(:page => params[:page]).order('name ASC')
  end

  def new
    @game = Game.new
  end
  
  def create
    @game = Game.new(params[:game])
    @game.save!
    
    redirect_to admin_games_path, :notice => "You've created a new game"
    rescue ActiveRecord::RecordInvalid
      render :new
  end
  
  def edit
    @game = Game.find(params[:id])
  end

  def update
    game = Game.find(params[:id])
    game.update_attributes(params[:game])
    redirect_to admin_games_path, :notice => game.name + " is updated!"
  end
end