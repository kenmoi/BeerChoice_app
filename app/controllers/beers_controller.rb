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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :feature, :style, :retailer, :origin, :abv, :image, :explanation)
  end
end
