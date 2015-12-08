class UserSessionsController < ApplicationController
  def new
    @session = User.new
  end

  def create
    if @session = login(params[:email], params[:password])
      redirect_back_or_to(:projects, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:projects, notice: 'Logged out!')
  end
end
