module Manager
  class MoviesController < Manager::BaseController

    def index
      @movies = Movies.page(params[:page])
    end
  end
end