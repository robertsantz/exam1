class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Article successfully saved"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def show
    @article = Article.find_by_id(params[:id])
  end
 
  def edit
  end

  def update
  end

  def destroy
  end

end
