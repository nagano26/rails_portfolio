class TalksController < ApplicationController
    def create
        @talk = Talk.create
        @entry1 = Entry.create(:talk_id => @talk.id, :user_id => current_user.id)
        @entry2 = Entry.create(params.require(:entry).permit(:user_id, :talk_id).merge(:talk_id => @talk.id))
        redirect_to "/talks/#{@talk.id}"
    end

    def show
        @talk = Talk.find(params[:id])
        if Entry.where(:user_id =>current_user.id, :talk_id =>@talk.id).present?
            @messages = @talk.messages
            @message = Message.new
            @entries = @talk.entries
        else
            redirect_back(fallback_location: root_path)
        end
    end
end
