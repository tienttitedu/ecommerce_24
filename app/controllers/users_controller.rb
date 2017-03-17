class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :check_session_logged, only: :new
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = User.find_by id: params[:id]
    return if @user
      flash[:danger] = t "user_invalid"
      redirect_to root_url
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes user_params
      flash[:success] = I18n.t "ud_pf_success"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :address, :phone_number,
      :password, :password_confirmation
  end

  def correct_user
    @user = User.find_by id: params[:id]
    return if current_user? @user
      flash[:danger] = t "user_invalid"
      redirect_to root_url
  end

end
