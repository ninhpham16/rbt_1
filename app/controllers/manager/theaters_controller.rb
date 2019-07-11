module Manager
  class TheatersController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    def index
      @theaters = Theater.order(created_at: :desc)
    end

    def new
      @theater = Theater.new
    end

    def create
      @theater = Theater.new theater_params
      if @theater.save
        @theaters = Theater.order(created_at: :desc)
        respond_to do |format|
          format.html
          format.js
        end
      else
        render :new
      end
    end

    private

    def theater_params
      params.require(:theater).permit(:name, :city_id)
    end
  end
end
