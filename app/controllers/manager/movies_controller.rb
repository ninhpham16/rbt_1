module Manager
  class MoviesController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_movie, except: %i[index new create]
    before_action :all_categories, only: %i[new edit]
    def index
      @movies = Movie.all.page(params[:page]).per Settings.per_page_movies
    end

    def new
      @movie = Movie.new
      @categories = Category.all
    end

    def create
      @movie = Movie.new movie_params
      if @movie.save
        respond_to do |format|
          format.html
          format.js
        end
        @movies = Movie.all.order(created_at: :desc)
      else
        flash[:danger] = t ".fails"
        render "new"
      end
    end

    def edit
      @categories = Category.all
    end

    def update
      if @movie.update movie_params
        flash[:success] = t ".success"
      else
        flash[:danger] = t ".danger"
      end
      redirect_to manager_movies_path
    end

    def destroy
      Movie.find(params[:id]).destroy
      flash[:success] = t ".success"
      redirect_to manager_movies_path
    end

    private

    def movie_params
      params.require(:movie).permit(:name, :available, :category_id, :director, :actor,
                                    :release, :rated, :trailer, :description, :image)
    end

    def find_movie
      @movie = Movie.find params[:id]
    end

    def all_categories; end
  end
end
