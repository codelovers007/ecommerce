class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to after_login_path(user)
    else
      flash[:alert] = "Something wrong"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logout"
    redirect_to new_sessions_path
  end

  private

  def after_login_path(user)
    user.admin? ? admin_products_path : root_path 
  end
end
