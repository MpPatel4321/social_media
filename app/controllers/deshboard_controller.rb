class DeshboardController < ApplicationController
  before_action :authenticate_user!
  def index
    DobJob.perform_later
    @user = current_user
    @posts = Post.ordered
  end
end
