class ApplicationController < ActionController::Base
  def authenticate_admin!
    authenticate_user!
    unless current_user.administrator?
      # sign_out current_user
      redirect_to(root_path, alert: "You do not have permission to access this page you have to login with admin account") and return
    end
  end
  def authenticate_manager!
    authenticate_user!
    unless current_user.manager?
      # Devise.sign_out_all_scopes ? sign_out : sign_out(current_user)
      redirect_to(root_path, alert: "You do not have permission to access this page you have to login with manager account") and return
    end
  end

  def after_sign_in_path_for(resource)
    if resource.administrator?
      admin_root_path
    elsif resource.manager?
      manager_root_path
    else
      root_path
    end
  end
end
