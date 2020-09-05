class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    @categories = Category.all
  end

  def show
    @document = Document.find(params[:id])
  end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to documents_path
    end
  end

  def edit
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    @document = @document.update(document_params)
    redirect_to documents_path
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    redirect_to documents_path
  end

  def document_params
    params.require(:document).permit(:title, :body, :category_id)
  end
end
