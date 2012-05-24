class Admin::CategoriesController < Admin::ApplicationController
  before_filter :require_admin_login
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    @parent_category = Category.where(["parent_id IS NULL"]).map{|x|[x.name, x.id]}
  end

  def create

    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category Successully created"
      redirect_to admin_categories_path
    else
      flash.now[:error] = "Category failed to create"
      render 'new'
    end
  end



end
