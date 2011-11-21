class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale  
  before_filter :setup_site_configuration
  helper_method :logged_in?, :current_user, :default_locale
  
  def default_locale
    I18n.locale
  end
  
  def set_locale
    I18n.locale = extract_locale_from_tld || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    if parsed_locale == "net"
      parsed_locale = "ar"
    else 
      parsed_locale = "en"
    end
    logger.debug "Language: " + parsed_locale
    I18n.available_locales.include?(parsed_locale.to_sym) ? parsed_locale  : nil
  end
  
  def get_activities
    @activities = Activity.includes(:user).order('id DESC').limit(74)
  end
  
  protected
  
    def logged_in?
      !current_user.nil?
    end
    
    def ensure_user_is_logged_in
      if current_user.nil?
        flash[:error] = 'You need to sign in before accessing this page!'
        redirect_to root_path
      end
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    
    def setup_site_configuration
      @settings = YAML.load_file(File.join(Rails.root, "config", "settings.yml"))[Rails.env]
    end
  
end
