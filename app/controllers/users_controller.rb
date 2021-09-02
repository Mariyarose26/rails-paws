class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  # As a User, I can view my profile
  def show
    @pets = User.find(params[:id]).pets
  end

  # As a user I can edit and update my profile
  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :address, :user_type, :photo)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
