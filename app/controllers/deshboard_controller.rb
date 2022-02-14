class DeshboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @posts = Post.ordered
  end
end
