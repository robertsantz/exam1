class ProductsController < ApplicationController

  def index
    @categories = (Category.all-Category.where(["parent_id IS NULL"])).map{|x|[x.name, x.id]}
    @products = Product.all

  end

  def new
    @product = Product.new
    @categories = (Category.all-Category.where(["parent_id IS NULL"]))
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to products_path, :notice => "Product successfully listed"
    else
          @categories = (Category.all-Category.where(["parent_id IS NULL"]))
      render 'new'
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
    @category = @product.category.name
  end

  def edit
    @product = Product.find_by_id(params[:id])
    @categories = (Category.all-Category.where(["parent_id IS NULL"]))
  end

  def update
    @product = Product.find_by_id(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to products_path, :notice => "Product successfully updated"
    else
      @categories = (Category.all-Category.where(["parent_id IS NULL"]))
      render 'edit'
    end
  end

  def destroy
    Product.destroy(params[:id])
    redirect_to products_path, :notice => "Product Successfully Deleted"
  end

end
