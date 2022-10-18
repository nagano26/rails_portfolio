class GoodLifestylesController < ApplicationController
    def create
        @GoodLifestyle = current_user.good_lifestyles.create(lifestyle_id: params[:lifestyle_id])
        @lifestyle = @GoodLifestyle.lifestyle
        @lifestyle.create_notification_like_lifestyle!(current_user)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @GoodLifestyle = GoodLifestyle.find_by(lifestyle_id: params[:lifestyle_id], user_id: current_user.id)
        @GoodLifestyle.destroy
        redirect_back(fallback_location: root_path)
    end
end
