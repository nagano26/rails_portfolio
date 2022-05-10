class GoodWorksController < ApplicationController
    def create
        @GoodWork = current_user.good_works.create(work_id: params[:work_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @GoodWork = GoodWork.find_by(work_id: params[:work_id], user_id: current_user.id)
        @GoodWork.destroy
        redirect_back(fallback_location: root_path)
    end
end
