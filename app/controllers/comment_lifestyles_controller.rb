class CommentLifestylesController < ApplicationController
    def create
        @lifestyle = Lifestyle.find(params[:lifestyle_id])
        @Comment = @lifestyle.comment_lifestyles.build(comment_params)
        @Comment.user_id = current_user.id
        @Comment.save
        redirect_to request.referer, notice: "コメントを投稿しました！！"
    end

    def destroy
        @Comment = CommentLifestyle.find(params[:id])
        @Comment.destroy
        redirect_to request.referer, notice: "コメントを削除しました！！"
    end
    
    private
    def comment_params
        params.require(:comment_lifestyle).permit(:content, :user_id, :lifestyle_id)
    end
end
