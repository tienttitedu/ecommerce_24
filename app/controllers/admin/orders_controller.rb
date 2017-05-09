class Admin::OrdersController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin

  def index
    @orders = Order.find_list_orders.paginate page: params[:page],
      per_page: Settings.per_page
  end

end
