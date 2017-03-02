class GroupDocumentsController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!

  def new
    @document = GroupDocument.new
  end

  def create
    @document = GroupDocument.new(group_document_params)

    if @document.save
      redirect_to '/zhaw/group_documents'
     else
       render action: 'new'
    end
  end

  def edit
    if current_user.username == GroupDocument.find(params[:id]).author || current_user.admin?
      @document = GroupDocument.find(params[:id])
    else
      redirect_to '/zhaw/group_documents'
    end
  end

  def update
    if current_user.username == GroupDocument.find(params[:id]).author || current_user.admin?
      @document = GroupDocument.find(params[:id])
      if @document.update_attributes(group_document_params)
        redirect_to '/zhaw/group_documents'
      else
        render 'edit'
      end
    else
      redirect_to '/zhaw/group_documents'
    end
  end

  def index
    @documents = GroupDocument.all
    @moduli = @documents.collect(&:modul).uniq
  end

  def destroy
    @document = GroupDocument.find(params[:id])
    if @document.author == current_user.username
      @document.destroy
    end
    redirect_to '/zhaw/group_documents'
  end

  private

  def group_document_params
    params.require(:group_document).permit(:title, :author, :description, :modul, :file, :group)
  end
end
