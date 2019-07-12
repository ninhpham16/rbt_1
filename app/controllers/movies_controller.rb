class MoviesController < ApplicationController

  def index
    @movies = @search.result.page(params[:page]).order(created_at: :desc).per(::Settings.movies)
  end
  def show
    @movie = Movie.find params[:id]
  end
end
