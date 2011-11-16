class MainController < ApplicationController
  before_filter :get_activities, :only => :help
  
  def index
    @title = t('navigation.home')
  end
  
  def about_us
    @title = t('navigation.about_us')
  end
  
  def help
    @title = t("navigation.help")
    @games = Game.all
  end
end
