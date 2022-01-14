class UsersController < ApplicationController
  def index
    @users = User.ordered
  end

  def show
    @user = User.find(params[:id])
  end
end
