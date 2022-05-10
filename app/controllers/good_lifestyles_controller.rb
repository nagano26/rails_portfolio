class GoodLifestylesController < ApplicationController
    def create
        @GoodLifestyle = current_user.good_lifestyles.create(lifestyle_id: params[:lifestyle_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @GoodLifestyle = GoodLifestyle.find_by(lifestyle_id: params[:lifestyle_id], user_id: current_user.id)
        @GoodLifestyle.destroy
        redirect_back(fallback_location: root_path)
    end
end
