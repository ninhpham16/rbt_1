module Importfile
  class ImportsController < ApplicationController
    def create
      Category.import(params[:file])
      redirect_to manager_categories_path
      flash[:success] = t ".success"
    end
  end
end
