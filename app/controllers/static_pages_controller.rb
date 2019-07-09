class StaticPagesController < ApplicationController
  def home
    @movies = Movie.last(Settings.amount_movie_index)
  end
end
