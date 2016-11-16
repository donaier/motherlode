class UserRequestsController < ApplicationController

  def create
    @user_request = UserRequest.new(user_request_params)

    unless @user_request.save
      redirect_to '/zhaw'
    end
  end

  private

  def user_request_params
    params.require(:user_request).permit(:email)
  end
end
