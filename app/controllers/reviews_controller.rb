class ReviewsController < ApplicationController
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params_reviews)
    @review.restaurant = @restaurant
    
    if @review.save
      redirect_to restaurant_path(@restaurant, anchor: "review-#{@review.id}")
    else
      render 'restaurants/show'
    end
  end

  private

  def params_reviews
    params.require(:review).permit(:content)
  end
end
