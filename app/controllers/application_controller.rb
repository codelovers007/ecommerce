class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :logged_in?, :current_user

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    return if logged_in?
    flash[:alert] = "Please login to continue"
    redirect_to new_sessions_path
  end

  def require_admin!
    return if logged_in? && current_user.admin?
    flash[:alert] = "You don't have permission to access this page."
    redirect_to root_path
  end
end
