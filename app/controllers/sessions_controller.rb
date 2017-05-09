class SessionsController < ApplicationController
  before_action :check_session_logged, only: :new

  def new
  end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      if current_user.admin?
        redirect_to admin_root_url
      else
      redirect_back_or products_url
      end
    else
      flash.now[:danger] = t "error_login"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
