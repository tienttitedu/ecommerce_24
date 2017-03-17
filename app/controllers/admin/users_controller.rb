class Admin::UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:index, :destroy]

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def destroy
    if User.find_by(id: params[:id]).nil?
      flash[:info] = t "user_not_exist"
      redirect_to admin_users_url
    else
      User.find(params[:id]).destroy
      flash[:success] = t "user_delete"
      redirect_to admin_users_url
    end
  end

end
