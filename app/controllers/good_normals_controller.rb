class GoodNormalsController < ApplicationController
    def create
        @GoodNormal = current_user.good_normals.create(normal_id: params[:normal_id])
        redirect_back(fallback_location: root_path)
    end

    def destroy
        @GoodNormal = GoodNormal.find_by(normal_id: params[:normal_id], user_id: current_user.id)
        @GoodNormal.destroy
        redirect_back(fallback_location: root_path)
    end
end
