module Manager
  class MovieTheatersController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_movie_theater, except:[:index, :new, :create]
    before_action :order, only:[:create, :update]

    def index
      @movie_theaters = MovieTheater.all.page(params[:page]).per Settings.per_page_movie_theaters
    end

    def new
      @movie_theater = MovieTheater.new 
      @supports = ::Supports::Theater.new @theater
      @supports = ::Supports::Movie.new @movie
      @supports = ::Supports::Room.new @room
    end

    def create
      @movie_theaters = MovieTheater.new city_params
      if @movie_theater.save
        respond_to do |format|
          format.html
          format.js
        end
      else
        render "new"
      end
    end

    def destroy
      @movie_theater.destroy
      flash[:success] = t ".success"
      redirect_to manager_movie_theaters_path
    end

    def edit
      @supports = ::Supports::Theater.new @theater
      @supports = ::Supports::Movie.new @movie
      @supports = ::Supports::Room.new @room
    end

    def update
      if @movie_theater.update_attributes movie_theater_params
        respond_to do |format|
          format.html
          format.js
        end
      else
        render "edit"
      end
    end

    private
    def movie_theater_params
      params.require(:movie_theater).permit(:theater_id, :movie_id, :room_id, :time)
    end

    def find_movie_theater
      @movie_theater = MovieTheater.find params[:id]
    end

    def order
      @movie_theaters = MovieTheater.order(created_at: :desc)
    end
  end
end
