class MessagesController < ApplicationController
    def create
        if Entry.where(:user_id => current_user.id, :talk_id => params[:message][:talk_id]).present?
            @message = Message.create(params.require(:message).permit(:user_id, :content, :talk_id).merge(:user_id => current_user.id))
            redirect_to "/talks/#{@message.talk_id}"
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
