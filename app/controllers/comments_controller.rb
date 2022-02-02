class CommentsController < ApplicationController
	def new
		if params[:type] == "Post"
			@commentable = Post.find(params[:id])
		else
			@commentable = Comment.find(params[:id])
		end
		@commentable_type = params[:type]
		@comment = Comment.new
	end

	def create
    @comment = Comment.new(comment_params)
    if comment_params[:commentable_type] == "Post"
			@post = Post.find(comment_params[:commentable_id])
		else
			@current_comment = Comment.find(comment_params[:commentable_id])
		end
		@commentable_type = comment_params[:commentable_type]
		@comment.save
  end

	private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
	end
end
