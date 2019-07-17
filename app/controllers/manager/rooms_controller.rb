module Manager
  class RoomsController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_room, only: %i[show edit update destroy]
    before_action :find_seats, only: %i[show edit]

    def index
      @rooms = Room.all.order(updated_at: :desc).page(params[:page]).per Settings.per_page_rooms
    end

    def show
    end

    def new
      @room = Room.new
      @supports = Supports::Theater.new @theater
    end

    def create
      @room = Room.new room_params
      if @room.save
        room_id = @room.id
        create_30_seats room_id
        flash[:success] = t ".success"
        redirect_to manager_room_path(room_id)
      else
        flash[:danger] = t ".failed"
        render "new"
      end
    end

    def edit
      @supports = Supports::Theater.new @room.theater
    end

    def update
      if @room.update room_params
        flash[:success] = t ".success"
        redirect_to manager_rooms_path
      else
        flash[:danger] = t ".failed"
        render "edit"
      end
    end

    def destroy
      @room.destroy
      flash[:success] = t ".success"
      redirect_to manager_rooms_path
    end

    private

    def room_params
      params.require(:room).permit(:name, :theater_id)
    end

    def find_room
      @room = Room.find params[:id]
    end

    def create_30_seats room_id
      ("A".."E").each do |row|
        (1..6).each do |col|
          seat = Seat.new
          seat.name = "#{row}#{col}"
          seat.room_id = room_id
          seat.available = true
          seat.save
        end
      end
    end

    def find_seats
      @seats = @room.seats.pluck(:id, :name, :available)
    end

  end
end
