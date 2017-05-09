class ReviewsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :correct_user

  def create
    @product = Product.find_by id: params[:product_id]
    @review = @product.reviews.new review_params
    @review.user= current_user
    if @review.save
      respond_to do |format|
        format.html {redirect_to @product}
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit :content
  end

  def correct_user
    @review = current_user.reviews.find_by id: params[:id]
  end

end
