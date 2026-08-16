class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :logged_in?, :current_user, :current_cart

  private

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_cart
    if logged_in? && current_user.cart.present?
      current_user.cart
    elsif session[:cart_id]
      Cart.find_by(id: session[:cart_id])
    else
      create_cart
    end
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

  def create_cart
    cart = Cart.create(user_id: logged_in? ? current_user.id : nil)
    session[:cart_id] = cart.id
    cart
  end
end
