class PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private
    def post_params
      params.require(:post).permit(:content, :type, :user_id, :avatar)
    end

end
