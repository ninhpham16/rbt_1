class CitiesController < ApplicationController
  def index
    @cities = City.page(params[:page]).order(name: :asc)
  end
end
