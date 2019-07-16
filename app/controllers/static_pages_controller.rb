class StaticPagesController < ApplicationController
  def home
    @movies = Movie.last Settings.amount_movie_index
  end

  def schedule
    @theater = Theater.find params[:theater]
    date = params[:date]
    @movie_theaters = @theater.movie_theaters.date_like date
    respond_to do |format|
      format.js { render layout: false }
    end
  end
end
