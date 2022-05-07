class WorksController < ApplicationController
  def index
    @works = Work.all
    @works = Work.all.reverse_order.page(params[:page]).per(5)
  end

  def show
    @work = Work.find(params[:id])
    @comment = CommentWork.new
    @comments = @work.comment_works.order(created_at: :desc)
  end
  
  def new
    @work = Work.new
  end

  def create
    @work = current_user.works.build(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @work = Work.find(params[:id])
    if @work.user != current_user
      redirect_to work_path, alert: "不正なアクセスです！！"
    end
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to work_path(@work), notice: "移住体験、更新致しました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to work_path(@work), notice: "削除致しました！！"
  end

  private
  def work_params
    params.require(:work).permit(:before_work, :current_work, :others_work, :message_work)
  end
end
