class GroupCommentsController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!

  def new
    @document = GroupDocument.find(params[:group_document_id])
    @comment = GroupComment.new
  end

  def create
    @document = GroupDocument.find(params[:group_document_id])
    @comment = GroupComment.new(group_comment_params)

    if @comment.save
      redirect_to '/zhaw/group_documents'
     else
       render action: 'new'
    end
  end

  def edit
    if current_user == GroupComment.find(params[:id]).user || current_user.admin?
      @document = GroupDocument.find(params[:group_document_id])
      @comment = GroupComment.find(params[:id])
    else
      redirect_to '/zhaw/group_documents'
    end
  end

  def update
    if current_user == GroupComment.find(params[:id]).user || current_user.admin?
      @comment = GroupComment.find(params[:id])
      if @comment.update_attributes(group_comment_params)
        redirect_to '/zhaw/group_documents'
      else
        render 'edit'
      end
    else
      redirect_to '/zhaw/group_documents'
    end
  end

  def destroy
    @comment = GroupComment.find(params[:id])
    if @comment.user == current_user
      @comment.destroy
    end
    redirect_to '/zhaw/group_documents'
  end

  private

  def group_comment_params
    params.require(:group_comment).permit(:group_document_id, :user_id, :comment, :modul, tags:[])
  end
end
