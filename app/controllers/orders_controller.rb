class OrdersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def edit
    @order = current_order
  end

  def update
    @order = current_order
    @order.order_items = current_order.order_items
    if @order.update_attributes order_params
      destroy_order
    end
    redirect_to root_path
  end


  private

  def order_params
    params.require(:order).permit :address_shipping, :user_id
  end

end
