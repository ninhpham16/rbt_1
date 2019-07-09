module Manager
  class CategoriesController < Manager::BaseController
    skip_before_action :verify_authenticity_token
    before_action :find_category, except: [:index, :new, :create]

    def index
      @categories = Category.all.page(params[:page]).per(Settings.per_page_categories)
    end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new category_params
      if @category.save
        flash[:success] = I18n.t "controllers.manager.categories.successful"
        redirect_to manager_categories_path
      else
        flash[:danger] = I18n.t "controllers.manager.categories.error"
        render "new"
      end
    end

    def edit
    end

    def update
      if @category.update_attributes category_params
        flash[:success] = I18n.t "controllers.manager.categories.successful"
        redirect_to manager_categories_path
      else
        flash[:danger] = I18n.t "controllers.manager.categories.error"
        render "edit"
      end
    end

    def destroy
      @category.destroy
      flash[:success] = I18n.t "controllers.manager.categories.successful"
      redirect_to manager_categories_path
    end

    private 
    def category_params
      params.require(:category).permit(:name)
    end

    def find_category
      @category = Category.find params[:id]
    end
  end
end
