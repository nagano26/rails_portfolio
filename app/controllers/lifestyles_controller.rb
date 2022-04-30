class LifestylesController < ApplicationController
  def index
    @lifestyles = Lifestyle.all
    @lifestyles = Lifestyle.all.reverse_order.page(params[:page]).per(10)
  end

  def show
    @lifestyle = Lifestyle.find(params[:id])
  end

  def new
    @lifestyle = Lifestyle.new
  end

  def create
    @lifestyle = current_user.lifestyles.build(lifestyle_params)
    if @lifestyle.save
      redirect_to lifestyle_path(@lifestyle), notice:"登録ありがとうございます"
    else
      render :new
    end
  end
  
  def edit
  end

  private
  def  lifestyle_params
    params.require(:lifestyle).permit(:price_life, :house_life, :dating_life, :system_life)
  end
end
