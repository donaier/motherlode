class UserRequestsController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!, except: [:create]

  def index
    @user_requests = UserRequest.all
  end

  def create
    @user_request = UserRequest.new(user_request_params)

    unless @user_request.save
      redirect_to '/zhaw'
    end
  end

  def destroy
    if current_user.admin?
      @user_request = UserRequest.find(params[:id])
      @user_request.destroy
    end
    redirect_to '/zhaw/user_requests'
  end

  private

  def user_request_params
    params.require(:user_request).permit(:email)
  end
end
