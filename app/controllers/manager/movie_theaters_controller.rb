module Manager
  class MovieTheatersController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_movie_theater, except: %i[index new create]
    before_action :order, only: %i[create update]

    def index
      @movie_theaters = MovieTheater.all.page(params[:page]).per Settings.per_page_movie_theaters
    end

    def new
      @movie_theater = MovieTheater.new
      @support_movie_theater = Support::MovieTheater.new
    end

    def create
      @movie_theater = MovieTheater.new movie_theater_params
      if @movie_theater.save
        create_showtime_seats @movie_theater.room_id, @movie_theater.id
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
      @support_movie_theater = Support::MovieTheater.new
    end

    def show
      @movie_theater = MovieTheater.find params[:id]
      @showtime_seats = @movie_theater.showtime_seats
      find_seats @showtime_seats
    end

    def update
      if @movie_theater.update movie_theater_params
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

    def create_showtime_seats room_id, movie_theater_id
      @room = Room.find room_id
      @room.seats.each do |seat|
        showtime_seat = ShowtimeSeat.new
        showtime_seat.movie_theater_id = movie_theater_id
        showtime_seat.seat_id = seat.id
        showtime_seat.seat_available = seat.available
        showtime_seat.save
      end
    end

    def find_seats showtime_seats
      @seats = showtime_seats.pluck(:id)
      seat_ids = showtime_seats.pluck(:seat_id)
      @seat_names = Seat.where(id: seat_ids).pluck(:name)
      @showtime_seats = ShowtimeSeat.where(id: @seats)
    end
  end
end
