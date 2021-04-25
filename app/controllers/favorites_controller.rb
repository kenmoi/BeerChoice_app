class FavoritesController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    beer_ids = Favorite.where(user_id: @user).pluck(:beer_id)
    @beers = Beer.where(id: beer_ids).order(created_at: :desc).page(params[:page]).per(10)
  end

  def create
    @beer = Beer.find(params[:beer_id])
    favorite = current_user.favorites.new(beer_id: @beer.id)
    favorite.save
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    favorite = current_user.favorites.find_by(beer_id: @beer.id)
    favorite.destroy
  end
end
