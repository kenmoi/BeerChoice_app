class BeersController < ApplicationController

  def new
    @beer = Beer.new
  end

  def create
    @beer = current_user.beers.new(beer_params)
    @beer.user_id = current_user.id
    if @beer.save
      flash[:notice] = "投稿が完了しました！"
      redirect_to beer_path(@beer.id)
    else
      render :new
    end
  end

  def index
    @beers = Beer.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    unless user_signed_in?
      flash[:notice] = "こちらからご登録後に閲覧いただけます！"
      redirect_to new_user_registration_path
    else
      @beer = Beer.find(params[:id])
      @comments = @beer.post_comments.all.order(created_at: :desc).page(params[:page]).per(10)
      @average = PostComment.where(beer_id: @beer.id).average(:rate)
      if @average.nil?
        @average = 0
      end
      @user = @beer.user
      @post_comment = PostComment.new
    end
  end

  def edit
    @beer = Beer.find(params[:id])
    if current_user == @beer.user
      @beer = Beer.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @beer = Beer.find(params[:id])
    if @beer.update(beer_params)
      flash[:notice] = "投稿内容を更新しました！"
      redirect_to beer_path(@beer)
    else
      render :edit
    end
  end

  def destroy
    beer = Beer.find(params[:id])
    beer.destroy
    flash[:notice] = "投稿を削除しました！"
    redirect_to beers_path
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :feature, :style, :retailer, :origin, :abv, :image, :explanation)
  end
end
