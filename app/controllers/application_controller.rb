class ApplicationController < ActionController::Base
  def require_admin!
    unless current_user and current_user.role == 'admin'
      redirect_to root_path, danger: "You don't belong there."
    end
  end
end
