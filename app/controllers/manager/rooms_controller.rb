module Manager
  class RoomsController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_room, only: [:edit, :update, :destroy]

    def index
      @rooms = Room.all.page(params[:page]).per Settings.per_page_rooms
    end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new room_params
      if @room.save
        flash[:success] = t ".success"
        redirect_to manager_rooms_path
      else
        flash[:danger] = t ".failed"
        render 'new'
      end
    end

    def edit
    end

    def update
      if @room.update_attributes room_params
        flash[:success] = t ".success"
        redirect_to manager_rooms_path
      else
        flash[:danger] = t ".failed"
        render 'edit'
      end
    end

    def destroy
      @room.destroy
      flash[:success] = t ".success"
      redirect_to manager_rooms_path
    end

  private

    def room_params
      params.require(:room).permit(:name)
    end

    def find_room
      @room = Room.find params[:id]
    end
  end
end
