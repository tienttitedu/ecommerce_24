class ProductsController < ApplicationController
  before_action :load_product, only: :show

  def index
    if params[:category_id]
      @products = Product.by_category([params[:category_id]]).paginate page: params[:page],
      per_page: Settings.per_page
      flash.now[:info] = t "no_product" if @products.empty?
    elsif params[:search]
      @products = Product.by_newest.search(params[:search]).paginate page:
        params[:page],per_page: Settings.per_page
      flash.now[:info] = t "not_found" if @products.empty?
    else
      condition = params[:condition].nil? ? "by_newest" : params[:condition]
      @products = Product.send("#{condition}").paginate page: params[:page],
      per_page: Settings.per_page
    end
    @order_item = current_order.order_items.new
  end

  def show
    @order_item = current_order.order_items.new
    @reviews = @product.reviews.reviews_newest
  end

  private

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "pr_invalid"
    redirect_to admin_products_url
  end

end
