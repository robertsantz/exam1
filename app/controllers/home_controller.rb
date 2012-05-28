class HomeController < ApplicationController

  def index
    @products = Product.limit(6)
    @articles = Article.limit(3)
  end
end
