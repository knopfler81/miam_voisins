class ReviewsController < ApplicationController

  def create
    @meal = Meal.find(params[:meal_id])
    @review = Review.new(review_params)
    @review.meal = @meal
    @review.user = current_user

    if @review.save
      flash[:notice] = 'Review was successfully created.'
      redirect_to @meal
    else
      flash[:notice] = "Error creating review: #{@review.errors}"
      render 'bookings/show'
    end
  end

  private
    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
