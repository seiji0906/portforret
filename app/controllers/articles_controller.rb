class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @categories = Category.all
    path = Rails.application.routes.recognize_path(request.referer)
    p path
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to articles_path
    else
      p @article.errors
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article = @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to articles_path
    end
  end

  def article_params
    params.require(:article).permit(:title, :body, :category_id)
  end
end
