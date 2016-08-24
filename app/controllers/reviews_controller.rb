class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    redirect_to '/restaurants'
  end
  # 
  # def show
  #   @restaurant = Restaurant.find(params:restaurant_id)
  #   @restaurant.reviews.each |review| do review.thoughts
  # end


  private

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
