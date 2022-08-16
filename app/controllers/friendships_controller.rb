class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @friendship = Friendship.create(user_id: current_user.id, friend_id: params[:friend_id])
    @friend = User.find(params[:friend_id])
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.update(is_friend: true)
    @friend = User.find(@friendship.user_id)
  end

  def destroy
    if (Friendship.where(user_id: params[:id], friend_id: current_user.id)).blank?
      @friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    else
      @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    end
    @friendship.destroy
    @friend = User.find(params[:id])
  end

  def friend_request
    @friend_requests = Friendship.where( friend_id: current_user.id, is_friend: false)
  end

end
