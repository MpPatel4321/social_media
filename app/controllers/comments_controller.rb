class CommentsController < ApplicationController
	def new
		@post = Post.find(params[:post_id])
		@comment = Comment.new
	end

	def create
    @comment = Comment.new(comment_params)
    @post = Post.find(comment_params[:post_id])
    @comment.save
  end

	private
	def comment_params
		params.require(:comment).permit(:comment, :user_id, :post_id)
	end
end
