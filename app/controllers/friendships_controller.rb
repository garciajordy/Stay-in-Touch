class FriendshipsController < ApplicationController
    def new
    end

    def create
        @friendship = current_user.friendships.create(user_id:current_user.id,friendship_params)
        redirect_to users_path
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
        redirect_to users_path
    end

    private
      def friendship_params
        params.require(:friendship).permit(:friend_id)
      end
end
