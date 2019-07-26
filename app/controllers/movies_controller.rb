class MoviesController < ApplicationController
  def index
    @search = Movie.search(params[:q])
    @results = @search.result.page(params[:page]).order(created_at: :desc).per(::Settings.movies)
  end

  def show
    @movie = Movie.find params[:id]
    @reviews = @movie.reviews.order("created_at asc")
    @review = @movie.reviews.build
  end
end
