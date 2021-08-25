class UserController < ApplicationController
  def show
  end

  def edit
  end

  def update
    if @user = User.update(user_params)
      redirect_to @user, 'The user has been successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
