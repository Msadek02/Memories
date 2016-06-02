class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)
    if @friendship.save
      flash[:notice] = "Added New friend"
      redirect_to profiles_path
    else
      flash[:error] = "Unable to add a friend"
      redirect_to root_path
    end
  end

  def new
    @friendship = Friendship.new
  end

  def destroy
  end

private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :user_id)
  end
end

