class AdminController < ApplicationController
  layout 'admin'
  
  before_filter :ensure_user_is_admin
  
  private
    def ensure_user_is_admin
      if current_user.nil? || !current_user.is_admin?
        redirect_to root_path
      end
    end
end
