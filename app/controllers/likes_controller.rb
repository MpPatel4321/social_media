class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: current_user.id, likeble_id: params[:post_id], likeble_type: params[:type])
		if params[:type] == "Post"
			@post = Post.find(params[:post_id])
		else
			@post = Comment.find(params[:post_id])
		end
	end

	def destroy
		@like = Like.find_by(user_id: current_user.id, likeble_id: params[:id], likeble_type: params[:type] )
		@type = params[:type]
		if params[:type] == "Post"
			@post = Post.find(params[:id])
		else
			@post = Comment.find(params[:id])
		end
		@like.destroy
	end
end
