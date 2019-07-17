class ReviewsController < ApplicationController
  def create
    @movie = Movie.find(review_params[:movie_id])
    @review = current_user.reviews.build(review_params)
    @review.save
    @reviews = @movie.reviews
  end

  private

  def review_params
    params.require(:review).permit(:content, :rate, :movie_id)
  end
end
