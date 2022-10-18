class CommentsController < ApplicationController
    def create
        @normal = Normal.find(params[:normal_id])
        @Comment = @normal.comments.build(comment_params)
        @Comment.user_id = current_user.id
        @Comment.save
        @normal.create_notification_comment!(current_user, @Comment.id)
        redirect_to request.referer, notice: "コメントを投稿しました！！"    
    end

    def destroy
        @Comment = Comment.find(params[:id])
        @Comment.destroy
        redirect_to request.referer, notice: "コメントを削除しました！！"
    end

    private
    def comment_params
        params.require(:comment).permit(:content, :user_id, :normal_id)
    end
end
