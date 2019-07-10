module Manager
  class MoviesController < Manager::BaseController
    def new
      @movie = Movie.new
      @categories = Category.all
    end

    def create
      @movie = Movie.new movie_params
        if @movie.save
        flash[:success] = t ".success"
        redirect_to new_manager_movie_path
      else 
        flash[:danger] = t ".fails"
        render "new"
      end
    end

    private
      def movie_params
        params.require(:movie).permit(:name,:category_id,:director,:actor, 
          :release,:rated,:trailer,:description,:image)
      end
  end
end
