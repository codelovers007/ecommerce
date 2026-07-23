class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logged in"
      redirect_to root_path
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
end
