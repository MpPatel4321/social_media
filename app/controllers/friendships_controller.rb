class FriendshipsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    @friends = Friendship.where( friend_id: current_user.id)
    @friends1 = Friendship.where( user_id: current_user.id)
    @friends = @friends + @friends1
  end

  def new
    @new_friendships = Friendship.new
    create
  end

  def create
    @friendship = Friendship.create(user_id: current_user.id, friend_id: params[:friend_id])
    
    flash[:notice] = "Friend Added"    
    redirect_to request.referrer
  end

  def destroy
    if (Friendship.where(user_id: params[:id], friend_id: current_user.id)).blank?
      @friendship = Friendship.find_by(user_id: current_user.id, friend_id: params[:id])
    else
      @friendship = Friendship.find_by(user_id: params[:id], friend_id: current_user.id)
    end
    @friendship.destroy

    flash[:alert] = "Removed successfully"
    redirect_to request.referrer

  end

end
