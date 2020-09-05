class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @articles = Article.where(category_id: @category.id)
    @documents = Document.where(category_id: @category.id)
    # path = Rails.application.routes.recognize_path(request.referer)
    # p path
    # @path = path[:controller]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category = @category.update(category_params)
    redirect_to categories_path
  end

  def destory
    @category = Category.find(params[:id])
    if @category.destory
      redirect_to categories_path
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
