class ApplicationController < ActionController::Base
  def require_admin!
    unless current_user and current_user.role == 'admin'
      flash[:alert] = 'You dont belong there.'
      redirect_to new_user_session_path
    end
  end
end
