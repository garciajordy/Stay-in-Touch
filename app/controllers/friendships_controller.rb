class FriendshipsController < ApplicationController


    def create
        @user = User.find(params[:format])
        @friendship = current_user.friendships.create(friend_id: params[:format])
        if @friendship.save
           redirect_to user_path(params[:format])
        else
           redirect_to users_path
        end
    end

    def destroy
        @friendship = Friendship.where(friend_id: params[:id]).where(user_id: current_user.id).first
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
        redirect_to users_path
    end
end
