class SearchsController < ApplicationController

  def search
    word = params[:word]
    beer_ids = Beer.search(word)
    # @beers = Beer.search(word).order(created_at: :desc).page(params[:page]).per(10)
    sort = params[:keyword]
    @beers = Beer.where(id: beer_ids).sort(sort).page(params[:page]).per(10)
    # @beers = Beer.search(word).sort(sort).page(params[:page]).per(10)
    # if @word ==
    # else
    #   @beers = Beer.order(sort)
    # end
    # @beers = Beer.search(word).sort(sort).page(params[:page]).per(10)
    # @beers = Beer.sort(sort)
  end

end
