class DocumentsController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!, except: :index

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to '/zhaw/documents'
     else
       render action: 'new'
    end
  end

  def edit
    if current_user.username == Document.find(params[:id]).author || current_user.admin?
      @document = Document.find(params[:id])
    else
      redirect_to '/zhaw/documents'
    end
  end

  def update
    if current_user.username == Document.find(params[:id]).author || current_user.admin?
      @document = Document.find(params[:id])
      if @document.update_attributes(document_params)
        redirect_to '/zhaw/documents'
      else
        render 'edit'
      end
    else
      redirect_to '/zhaw/documents'
    end
  end

  def index
    @documents = Document.all
    @moduli = @documents.collect(&:modul).uniq
  end

  private

  def document_params
    params.require(:document).permit(:title, :author, :description, :modul, :file)
  end
end
