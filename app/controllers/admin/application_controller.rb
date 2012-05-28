class Admin::ApplicationController < ApplicationController
  protect_from_forgery
  
  def require_admin_login
    if current_user.nil? || !current_user.is_admin?
      flash[:notice] = "Only admin permited"
      redirect_to root_url
    else
      return current_user
    end
  end
end
