class LikesController < ApplicationController

	def create
		@like = Like.create(user_id: current_user.id, post_id: params[:post_id])
		@post = Post.find(params[:post_id])
	end

	def destroy
		@like = Like.find_by(user_id: current_user.id, post_id: params[:id])
		@post = Post.find(params[:id])
		@like.destroy
	end
end
