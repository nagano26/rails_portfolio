class NormalsController < ApplicationController
  def index
    @normals = Normal.all
  end
  
  def new
    @normal = Normal.new
  end

  def create
    @normal = current_user.normals.build(normal_params)
    if @normal.save
      redirect_to normals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @normal = Normal.find(params[:id])
  end

  def edit
  end

  private
  def normal_params
    params.require(:normal).permit(:before_address, :current_address, :trigger, :preparation) 
  end
end
