class ReviewsController < ApplicationController
  before_action :set_restaurant
  def new
    # we need @restaurant in our `simple_form_for`
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @review.restaurant = Restaurant.find(params[:restaurant_id])
    @review.save
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
