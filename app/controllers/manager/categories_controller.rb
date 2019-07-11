module Manager
  class CategoriesController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_category, except: [:index, :new, :create]
    before_action :order, only: [:create, :update]

    def index
      @categories = Category.all.page(params[:page]).per Settings.per_page_categories
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new category_params
      if @category.save
        respond_to do |format|
          format.html
          format.js
        end
      else
        render "new"
      end
    end

    def edit
    end

    def update
      if @category.update_attributes category_params
        respond_to do |format|
          format.html
          format.js
        end
      else
        render "edit"
      end
    end

    def destroy
      @category.destroy
      flash[:success] = t ".success"
      redirect_to manager_categories_path
    end

    private 
    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find params[:id]
    end

    def order
      @categories = Category.order(created_at: :desc)
    end
  end
end
