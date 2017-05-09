class Admin::ProductsController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :load_product, only: [:show, :edit, :update,:destroy]

  def index
    if params[:category_id]
      @products = Product.by_category(params[:category_id]).paginate page: params[:page],
      per_page: Settings.per_page
      flash.now[:info] = t "no_product" if @products.empty?
    else
      @products = Product.by_newest.paginate page: params[:page],
      per_page: Settings.per_page
    end
    @last_child_category = Category.find_last_children
  end

  def show
    @order_item = current_order.order_items.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "create_success"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = I18n.t "ud_cate_success"
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find_by id: params[:id]
    if @product && @product.destroy
      flash[:success] = t "destroy_success"
    else
      flash[:danger] = t "destroy_error"
    end
    redirect_to admin_products_url
  end

  private

  def product_params
    params.require(:product).permit :name, :description, :price, :quantity,
    :image, :category_id,:remote_image_url
  end

  def load_product
    @product = Product.find_by id: params[:id]
    return if @product
    flash[:danger] = t "pr_invalid"
    redirect_to admin_products_url
  end

end
