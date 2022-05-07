class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @reservation = Reservation.new
  end

  def index
    @user = current_user
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation), notice: "お部屋の予約致しました！！"
    else
      @room = Room.find(@reservation.room_id)
      render 'rooms/show', status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path, notice: "お部屋のキャンセル致しました！！"
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :number_people, :total_price, :total_day, :user_id, :room_id)
   end
end
