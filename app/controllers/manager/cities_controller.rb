module Manager
  class CitiesController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_city, except:[:index, :new, :create]

    def index
      @cities = City.all.page(params[:page]).per Settings.per_page_cities
    end

    def new
      @city = City.new 
    end

    def create
      @city = City.new city_params
      if @city.save
        flash[:success]  = t ".success"
        redirect_to manager_cities_path
      else
        render "new"
      end
    end

    def edit
    end

    def update
      if @city.update_attributes city_params
        flash[:success]  = t ".success"
        redirect_to manager_cities_path
      else
        render "edit"
      end
    end

    def destroy
      @city.destroy
      flash[:success] = t ".success"
      redirect_to manager_cities_path
    end

    private
    def city_params
      params.require(:city).permit(:name)
    end

    def find_city
      @city = City.find params[:id]
    end
  end
end
