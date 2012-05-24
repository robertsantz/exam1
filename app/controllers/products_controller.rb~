class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new
    if @product.save
      redirect_to products_path, :notice => "Product successfully listed"
    else
      flash.now.error = "Product failed to save"
      render 'new'
    end
  end

end
