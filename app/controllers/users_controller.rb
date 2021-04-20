class UsersController < ApplicationController

  def mypage
    unless user_signed_in?
      flash[:notice] = "こちらからご登録後に閲覧いただけます！"
      redirect_to new_user_registration_path
    else
      @user = User.find(params[:id])
    end
  end

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(8)
  end

  def show
    unless user_signed_in?
      flash[:notice] = "こちらからご登録後に閲覧いただけます！"
      redirect_to new_user_registration_path
    else
      @user = User.find(params[:id])
      if current_user == @user
        @user = User.find(params[:id])
      else
        redirect_to mypage_path(current_user.id)
      end
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user == @user
      @user = User.find(params[:id])
    else
      redirect_to mypage_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集内容を保存しました！"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def delete_image
    @user = User.find(params[:id])
    @user.profile_image = nil
    @user.save!
    flash[:notice] = "プロフィール画像を削除しました！"
    render :action => 'edit'
    return
  end

  def cancel
  end

  def quit
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用いただきありがとうございました！またのお越しをお待ちしております！"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :sex, :prefecture_id, :favorite_style, :favorite_beer, :profile_image, :introduction)
  end

end
