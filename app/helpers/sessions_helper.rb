module SessionsHelper

  def log_in user
    session[:user_id] = user.id
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      current_order= Order.new
      # session[:order_id] = current_order.id
    end
  end

  def destroy_order
    session.delete(:order_id)
    @current_order = nil
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def last_children? category
    Category.find_last_children.exists? category
  end

  def original? category
    Category.find_originals.exists? category
  end

  def children category
    @categories = category.children
  end

  def original
    @categories = Category.find_originals
  end

  def current_user? user
    user == current_user
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end

  def redirect_back_or default
    redirect_to session[:forwarding_url] || default
    session.delete :forwarding_url
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end

  def verify_admin
    unless current_user.admin?
      flash[:danger] = t "please_login_user_admin"
      redirect_to root_url
    end
  end

end
