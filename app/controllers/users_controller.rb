class UsersController < ApplicationController
  before_action :correct_user, only: :show

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :phone_number,
      :password, :password_confirmation
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if @user
      flash[:danger] = t "user_invalid"
      redirect_to root_url
  end

end
