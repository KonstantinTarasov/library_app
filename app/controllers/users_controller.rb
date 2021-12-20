class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
  end

  def edit
  end

  def update
    if @user = User.update(user_params)
      redirect_to user_url
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'The user was successfully deleted'
  end

  private

  def set_current_user
    @user = current_user
  end

  def set_user
    @user = User.find_by(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
