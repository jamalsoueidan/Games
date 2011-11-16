module AdminHelper
  def is_admin?
    return false unless logged_in?
    return current_user.is_admin?
  end
end
