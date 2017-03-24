class Admin::CategoriesController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin
  before_action :load_category, only: [:show, :edit, :destroy]

  def index
    @categories = Category.find_originals.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.parent_id && !Category.where(id: @category.parent_id).present?
      flash[:info] = t "errors_parent"
      render :new and return
    end
    if @category.save
      flash[:success] = t "create_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show
    @categories = @category.children
  end

  def destroy
    if @category.destroy
      flash[:success] = t "cate_delete"
    else
      flash[:danger] = t "cate_invalid"
    end
    redirect_to admin_categories_url
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = I18n.t "ud_cate_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit :name, :description, :parent_id
  end

  def load_category
    @category = Category.find_by id: params[:id]
    return if @category
    flash[:danger] = t "cate_invalid"
    redirect_to admin_categories_url
  end

end
