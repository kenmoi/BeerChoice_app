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
      redirect_to beers_path
      # @beers = Beer.all
      # @user = User.find(current_user.id)
      # render :index
    end
  end

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
    @comments = @beer.post_comments.all.order(created_at: :desc).page(params[:page]).per(10)
    @commment = PostComment.where(beer_id: @beer.id).average(:rate)
    @user = @beer.user
    @post_comment = PostComment.new
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
      flash[:alert] = "入力に間違いがあります！"
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
