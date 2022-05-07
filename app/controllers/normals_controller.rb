class NormalsController < ApplicationController
  def index
    @normals = Normal.all
    @normals = Normal.all.reverse_order.page(params[:page]).per(5)
  end
  
  def new
    @normal = Normal.new
  end

  def create
    @normal = current_user.normals.build(normal_params)
    if @normal.save
      redirect_to normals_path, notice: "移住体験、新規投稿致しました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @normal = Normal.find(params[:id])
    @comment = Comment.new
    @comments = @normal.comments.order(created_at: :desc)
  end

  def edit
    @normal = Normal.find(params[:id])
    if @normal.user != current_user
      redirect_to normal_params, alert: "不正なアクセスです！！"
    end
  end

  def update
    @normal = Normal.find(params[:id])
    if @normal.update(normal_params)
      redirect_to normal_path(@normal), notice: "移住体験、更新致しました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    normal = Normal.find(params[:id])
    normal.destroy
    redirect_to normal_path, notice: "体験談の削除、完了致しました！！"
  end

  private
  def normal_params
    params.require(:normal).permit(:before_address, :current_address, :trigger, :preparation) 
  end
end
