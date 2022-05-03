class WorksController < ApplicationController
  def index
    @works = Work.all
    @works = Work.all.reverse_order.page(params[:page]).per(5)
  end

  def show
    @work = Work.find(params[:id])
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
