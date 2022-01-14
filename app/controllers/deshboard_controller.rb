class DeshboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.ordered
  end
end
