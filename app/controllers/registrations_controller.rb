class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      flash[:notice] = "User successfully registered"
      redirect_to root_path
    else
      flash[:alert] = "Something is wrong"
      render :new, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_cofirmation)
  end
end
