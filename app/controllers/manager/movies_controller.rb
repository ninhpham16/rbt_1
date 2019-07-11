module Manager
  class MoviesController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_movie, except: [:index, :new, :create]
    before_action :all_categories, only: [:new, :edit]
    def index
      @movies = Movie.all.page(params[:page]).per Settings.per_page_movies
    end

    def new
      @movie = Movie.new
      @categories = Category.all
    end

    def create
      if @movie.save
        flash[:success] = t ".success"
        redirect_to manager_movies_path
      else 
        flash[:danger] = t ".fails"
        render "new"
      end
    end

    def edit
      @categories = Category.all
    end

    def update
      if @movie.update_attributes movie_params
        flash[:success] = t ".success"
        redirect_to manager_movies_path
      else
        flash[:danger] = t ".danger"
        redirect_to manager_movies_path
      end
    end

    def destroy
      Movie.find(params[:id]).destroy
      flash[:success] = t ".success"
      redirect_to manager_movies_path
    end

    private
      def movie_params
        params.require(:movie).permit(:name,:available,:category_id,:director,:actor, 
          :release,:rated,:trailer,:description,:image)
      end

      def find_movie
        @movie = Movie.find params[:id]
      end
      
      def all_categories

      end  
  end
end
