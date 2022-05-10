class FavoritesController < ApplicationController

    def create
        @favorite = current_user.favorites.create(room_id: params[:room_id])
        @room = @favorite.room
        @room.create_notification_like_room!(current_user)
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @favorite = Favorite.find_by(room_id: params[:room_id], user_id: current_user.id)
        @favorite.destroy
        redirect_back(fallback_location: root_path)
    end
end
