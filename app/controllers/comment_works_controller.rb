class CommentWorksController < ApplicationController
    def create
        @work = Work.find(params[:work_id])
        @Comment = @work.comment_works.build(comment_params)
        @Comment.user_id = current_user.id
        @Comment.save
        @work.create_notification_comment_work!(current_user, @Comment.id)
        redirect_to request.referer, notice: "コメントを投稿しました！！"
    end

    def destroy
        @Comment = CommentWork.find(params[:id])
        @Comment.destroy
        redirect_to request.referer, notice: "コメントを削除しました！！"
    end
    
    private
    def comment_params
        params.require(:comment_work).permit(:content, :user_id, :work_id)
    end
end
