class DocumentsController < ApplicationController

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)

    if @document.save
      redirect_to '/zhaw'
     else
       render action: 'new'
    end
  end

  def edit
    # todo nur vom author
    @document = Document.find(params[:id])
  end

  def update
    @document = Document.find(params[:id])
    if @document.update_attributes(document_params)
      redirect_to '/zhaw'
    else
      render 'edit'
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :author, :description)
  end
end
