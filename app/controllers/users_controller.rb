class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
