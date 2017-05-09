class StaticPagesController < ApplicationController

  def home
    @products = Product.by_newest.paginate page: params[:page],
      per_page: Settings.per_page
    @order_item = current_order.order_items.new
  end

end
