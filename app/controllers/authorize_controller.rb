class AuthorizeController < ApplicationController
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_with_auth(auth)
    if user.nil?
      user = User.new_omniauth(auth)
      if user.save
        success_sign_in(user)
      else
        session[:auth] = auth
        redirect_to new_user_path
      end
    else
      success_sign_in(user)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out!"
  end
  
  private
    def success_sign_in(user)
      user.update_session!(:ip_address => request.remote_addr)
      session[:user_id] = user.id
      render :text => '<script type="text/javascript"> window.close(); window.opener.location = "' + send(default_locale.to_s + '_games_url')+ '"; </script>', :layout => false
    end
end