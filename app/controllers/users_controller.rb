class UsersController < ApplicationController
  def index
    @user = current_user
  end

  def show
    @user= User.find(params[:id])
    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.talk_id == u.talk_id then
            @isTalk = true
            @talkId = cu.talk_id
          end
        end
      end
      if @isTalk
      else
        @talk = Talk.new
        @entry = Entry.new
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path, alert: "不正のアクセスです"
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールの更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end
end
