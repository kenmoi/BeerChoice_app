class UsersController < ApplicationController

  def mypage
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @user = User.find(params[:id])
    else
      redirect_to mypage_path(current_user.id)
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
      flash[:notice] = "編集内容を保存しました。"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @image = @user.profile_image.id
    @image.destroy
    flash[:notice] = "プロフィール画像を削除しました。"
    redirect_to edit_user_path(@user)
  end

  def cancel
  end

  def quit
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ご利用いただきありがとうございました。またのお越しをお待ちしております。"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :birth_date, :sex, :prefecture_id, :favorite_style, :favorite_beer, :profile_image, :introduction)
  end

end
