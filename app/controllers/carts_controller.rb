class CartsController < ApplicationController
  before_action :load_cart, only: :show

  def show
  end

  private

  def load_cart
    @order_items = current_order.order_items
    if @order_items.size <= Settings.min_order
      redirect_to products_path
    end
  end

end
