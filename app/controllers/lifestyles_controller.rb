class LifestylesController < ApplicationController
  def index
    @lifestyles = Lifestyle.all
    @lifestyles = Lifestyle.all.reverse_order.page(params[:page]).per(5)
  end

  def show
    @lifestyle = Lifestyle.find(params[:id])
    @comment = CommentLifestyle.new
    @comments = @lifestyle.comment_lifestyles.order(created_at: :desc)
  end

  def new
    @lifestyle = Lifestyle.new
  end

  def create
    @lifestyle = current_user.lifestyles.build(lifestyle_params)
    if @lifestyle.save
      redirect_to lifestyles_path, notice: "移住体験、更新致しました！！"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @lifestyle = Lifestyle.find(params[:id])
    if @lifestyle.user != current_user
      redirect_to lifestyle_path, alert: "不正なアクセスです！！"
    end
  end
  
  def update
    @lifestyle = Lifestyle.find(params[:id])
    if @lifestyle.update(lifestyle_params)
      redirect_to lifestyle_path(@lifestyle), notice: "移住体験、更新致しました！！"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    lifestyle= Lifestyle.find(params[:id])
    lifestyle.destroy
    redirect_to lifestyle_path, notice: "体験談の削除、完了致しました！！"
  end

  private
  def  lifestyle_params
    params.require(:lifestyle).permit(:price_life, :house_life, :dating_life, :system_life)
  end
end
