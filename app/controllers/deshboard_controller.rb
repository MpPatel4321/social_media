class DeshboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # UserMailer.login_email(current_user).deliver_now
    @user = current_user
    @posts = Post.ordered
  end
end
