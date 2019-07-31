module Importfile
  class ImportsController < ApplicationController
    def create
      @file = params[:file]
      if @file.present?
        if Import.call(@file)
          flash[:success] = t ".success"
          redirect_to manager_categories_path
        else
          flash[:warning] = t ".invalid"
          redirect_to manager_categories_path
        end
      else
        flash[:error] = t ".empty"
        redirect_to manager_categories_path
      end
    end
  end
end
