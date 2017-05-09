class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = I18n.t "pl_login"
      redirect_to login_url
    end
  end

  def check_session_logged
    redirect_to root_url if logged_in?
  end

end
