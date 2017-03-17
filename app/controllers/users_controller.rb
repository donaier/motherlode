class UsersController < ApplicationController
  layout 'zhaw_layout'
  before_filter :authenticate_user!

  def index
    @users = User.all.order(:group) if current_user.admin?
  end
end
